package XML::Aiml::Category::Template::Set::Srai;
use Moose;
use MooseX::AttributeHelpers;

has 'get_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Set::Srai::Get]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'get' },
    description => { sort_order => 0, },
);
has 'text' => (
    isa         => 'Str',
    is          => 'rw',
    traits      => ['XML'],
    description => { sort_order => 1, },
);

no Moose;
1;
__END__
