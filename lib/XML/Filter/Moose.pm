package XML::Filter::Moose;
use Moose;
use Moose::Autobox;

extends qw(XML::SAX::Base Moose::Object);

has stack => (
    isa       => 'ArrayRef',
    is        => 'ro',
    lazy      => 1,
    default   => sub { [] },
    clearer   => 'reset_stack',
    metaclass => 'Collection::Array',
    provides  => {
        push => 'add_element',
        pop  => 'pop_element'
    }
);

has text => (
    isa       => 'Str',
    is        => 'rw',
    metaclass => 'String',
    lazy      => 1,
    clearer   => 'reset_text',
    predicate => 'has_text',
    default   => sub {''},
    provides  => { append => 'append_text', },
);

sub root {
    shift->stack->[0];
}

sub current_element {
    shift->stack->[-1];
}

sub is_root { return shift->stack->length == 0 }

sub parent_element {
    my ($self) = @_;
    if ( $self->stack->length > 1 ) {
        return $self->stack->[-1];
    }
    $self->root;
}

sub start_document {
    my ( $self, $doc ) = @_;
    inner();
    $self->reset_stack;
}

sub start_element {
    my ( $self, $el ) = @_;
    inner();
    $self->add_element($el);
}

sub characters {
    my ( $self, $el ) = @_;
    inner();
    $self->append_text( $el->{Data} ) if $el->{Data} =~ /\S/;
}

sub end_element {
    my ( $self, $el ) = @_;
    inner();
    $self->pop_element;
    $self->reset_text;
}

sub end_document {
    my ( $self, $doc ) = @_;
    inner();
}

no Moose;
1;
__END__

=head1 NAME

XML::Filter::Moose - A Moose-ified base class for XML::SAX 

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

    package MyFilter;
    use Moose
    extends qw(XML::SAX::Base);

    augment start_element => start {
        my ($self, $el) = @_;
        $el->{Data} = [do something];
    };

=head1 DESCRIPTION

The XML::Filter::Moose class implements ...

=head1 ATTRIBUTES

=head2 stack - ArrayRef

=head2 text - Str

=head1 METHODS

=head2 root()

Returns the root element, or the first element in the stack

=head2 current_element()

Insert description of subroutine here...

=head2 is_root()

Return true if we are currently working on the root element.

=head2 parent_element()

Returns the parent of the current element.

=head2 start_document($document)

Fires at the start of the document.

=head2 start_element($element)

Fires at the start of an element.

=head2 characters($element)

Fires at the start of a text node.

=head2 end_element($element)

Fires at the end of an element.

=head2 end_document($document)

Fires at the end of a document.

=head1 DEPENDENCIES

L<Moose|Moose>

L<Moose::Autobox|Moose::Autobox>

L<XML::SAX::Base|XML::SAX::Base>

=head1 BUGS AND LIMITATIONS

Please report any bugs or feature requests to
C<bug-xml-toolkit@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.

=head1 AUTHOR

Chris Prather (chris@prather.org)

Based upon L<XML::SAX::Base|XML::SAX::Base>

Kip Hampton (khampton@totalcinema.com) 

Robin Berjon (robin@knowscape.com) 

Matt Sergeant (matt@sergeant.org) 

=head1 LICENCE

Copyright 2009 by Chris Prather.

This software is free.  It is licensed under the same terms as Perl itself.

=cut
