package XML::Toolkit::RNG::Grammar::Define;
use Moose;
use MooseX::AttributeHelpers;

has 'choice_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Choice]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'choice' },
    description => { sort_order => 0, },
);
has 'element_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Element]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'element' },
    description => { sort_order => 1, },
);
has 'interleave_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Interleave]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'interleave' },
    description => { sort_order => 2, },
);
has 'name' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    description => {
        Prefix       => "",
        LocalName    => "name",
        node_type    => "attribute",
        Name         => "name",
        NamespaceURI => "",
        sort_order   => 3,
    },
);
has 'optional_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Optional]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'optional' },
    description => { sort_order => 4, },
);
has 'zeroOrMore_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::ZeroOrMore]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'zeroOrMore' },
    description => { sort_order => 5, },
);

no Moose;
1;
__END__