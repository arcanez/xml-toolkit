package XML::Aiml::Category::Template;
use Moose;
use MooseX::AttributeHelpers;

has 'bot_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Bot]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'bot' },
    description => { sort_order => 0, },
);
has 'date_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Date]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'date' },
    description => { sort_order => 1, },
);
has 'get_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Get]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'get' },
    description => { sort_order => 2, },
);
has 'person_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Person]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'person' },
    description => { sort_order => 3, },
);
has 'random_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Random]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'random' },
    description => { sort_order => 4, },
);
has 'set_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Set]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'set' },
    description => { sort_order => 5, },
);
has 'sr_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Sr]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'sr' },
    description => { sort_order => 6, },
);
has 'srai_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Srai]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'srai' },
    description => { sort_order => 7, },
);
has 'text' => (
    isa         => 'Str',
    is          => 'rw',
    traits      => ['XML'],
    description => { sort_order => 8, },
);
has 'thastar_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Thastar]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'thastar' },
    description => { sort_order => 9, },
);
has 'thatstar_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Thatstar]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'thatstar' },
    description => { sort_order => 10, },
);
has 'think_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Think]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'think' },
    description => { sort_order => 11, },
);

no Moose;
1;
__END__
