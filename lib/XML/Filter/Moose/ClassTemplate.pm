package XML::Filter::Moose::ClassTemplate;
use Moose::Role;

has template => (
    isa        => 'Str',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_template {
    return <<'END_TEMPLATE'

package [% meta.name %];
use Moose;
use MooseX::AttributeHelpers;

[% FOREACH attr_name IN meta.get_attribute_list.sort -%]
[% attr = meta.get_attribute(attr_name) -%]
has '[% attr_name %]' => (
     isa         => '[% attr.type_constraint.name %]',
     is          => '[% IF attr.has_accessor %]rw[% ELSE %]ro[%END%]',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],
 [%- IF attr.type_constraint.is_subtype_of("ArrayRef") -%]
     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => '[% attr_name.remove("_collection") %]' },
     description => {
         sort_order => [% loop.index() %],
     },
[% ELSE -%]
 description => {
[% FOREACH name IN attr.description.keys -%]
     [% name %] => "[% attr.description.$name %]",
[% END -%]
     sort_order => [% loop.index() %],
 },
[% END -%]
);
[% END -%]

no Moose;
1;
__END__
[% END %]

END_TEMPLATE

}

has tt_config => (
    isa     => 'HashRef',
    is      => 'ro',
    lazy    => 1,
    default => sub {
        {
            OUTPUT_PATH => '.',
            EVAL_PERL   => 1,
            POST_CHOMP  => 1,
        };
    },
);

has tt => (
    isa     => 'Template',
    is      => 'ro',
    lazy    => 1,
    default => sub { Template->new( $_[0]->tt_config ) },
    handles => [qw(error)],
);

sub render {
    my ($self) = @_;
    my $output;
    $output .= $self->render_class($_)
      for ( sort { $a->name cmp $b->name } $self->classes );
    return $output;
}

sub render_class {
    my ( $self, $class ) = @_;
    my $output;
    $self->tt->process( \$self->template, { meta => $class }, \$output )
      || die $self->error;
    return $output;
}

no Moose::Role;
1;
__END__
