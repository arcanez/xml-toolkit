package XML::Toolkit::RNG::Grammar::Define::Choice::Element::Choice;
use Moose;
use MooseX::AttributeHelpers;

has 'attribute_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Choice::Element::Choice::Attribute]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'attribute' },
    description => { sort_order => 0, },
);
has 'ref_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Choice::Element::Choice::Ref]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'ref' },
    description => { sort_order => 1, },
);

no Moose;
1;
__END__
