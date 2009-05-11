package XML::Toolkit::RNG::Grammar::Define::Element::Attribute::Data;
use Moose;
use MooseX::AttributeHelpers;

has 'type' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "type",
        node_type    => "attribute",
        Name         => "type",
        NamespaceURI => "",
        sort_order   => 0,
    },
);

no Moose;
1;
__END__
