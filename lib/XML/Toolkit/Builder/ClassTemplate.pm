package XML::Toolkit::Builder::ClassTemplate;
use Moose::Role;

has template => (
    isa        => 'Str',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_template {
    return q[
package [% meta.name %];
use Moose;
use namespace::autoclean;
use XML::Toolkit;

[% FOREACH attr_name IN meta.get_attribute_list.sort -%]
[% attr = meta.get_attribute(attr_name) -%]
has '[% attr_name %]' => (
     isa         => '[% attr.type_constraint.name %]',
     is          => '[% IF attr.has_accessor %]rw[% ELSE %]ro[%END%]',
 [%- IF attr.type_constraint.is_subtype_of("ArrayRef") %]

     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_[% attr_name.remove("_collection") %] => ['push'] },
     description => {
         sort_order => [% loop.index() %],
     },
[%- ELSE %]
   
     traits      => [ 'XML'],
     description => {
[% FOREACH name IN attr.description.keys -%]
        [% name %] => "[% attr.description.$name %]",
[% END -%]
        sort_order => [% loop.index() %],
     },
[% END -%]
);
[% END -%]

1;

]
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
    isa        => 'Template',
    is         => 'ro',
    lazy_build => 1,
    handles    => [qw(error)],
);

sub _build_tt { Template->new( $_[0]->tt_config ) }

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

=head1 NAME

XML::Toolkit::Builder::ClassTemplate - A class to ...

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

use XML::Toolkit::Builder::ClassTemplate;

=head1 DESCRIPTION

The XML::Toolkit::Builder::ClassTemplate class implements ...

=head1 SUBROUTINES / METHODS

=head2 _build_template (method)

Parameters:
    none

Arguments:
    $_[0]

Insert description of method here...

=head2 render (method)

Parameters:
    none

Insert description of method here...

=head2 render_class (method)

Parameters:
    class

Insert description of method here...

=head1 DEPENDENCIES

Modules used, version dependencies, core yes/no

Moose::Role

Moose

MooseX::AttributeHelpers

=head1 NOTES

...

=head1 BUGS AND LIMITATIONS

None known currently, please email the author if you find any.

=head1 AUTHOR

Chris Prather (perigrin@domain.tld)

=head1 LICENCE

Copyright 2009 by Chris Prather.

This software is free.  It is licensed under the same terms as Perl itself.

=cut
