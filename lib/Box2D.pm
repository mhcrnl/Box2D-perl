package Box2D;

use warnings;
use strict;
our @ISA = qw(Exporter);

=head1 NAME

Box2D - 2D Physics Library

=head1 OVERVIEW

Currently this module is a 1 to 1 binding. This is still a WIP and so far here are the completed class:

	b2Body                 
	b2BodyDef              
	b2Contact
	b2Fixture
	b2FixtureDef
	b2Manifold
	b2PolygonShape
	b2CircleShape
	b2Shape
	b2Vec2
	b2World
	PerlContactListener

=head2 USAGE

Have a look at the examples folder for useage examples. 

The Box2D Manual and Documentation are also useful:

L<http://www.box2d.org/documentation.html> 

=head2 TODO

	Documentation 
	Examples 
	Adding more bindings
	Inline::C Support

=head2 CONTRIBUTE

To contribute to this module please contact us on github:

L<https://github.com/PerlGameDev/Box2D-perl>

=cut

our $VERSION = '0.02';

require XSLoader;
XSLoader::load('Box2D', $VERSION);
require Exporter;

our @EXPORT_OK   = ();
our %EXPORT_TAGS = ( );

use constant {
#b2Body Type 
b2_staticBody => 0,
b2_kinematicBody => 1,
b2_dynamicBody => 2,

#b2Shape Type 
e_unknown=> -1,
e_circle => 0,
e_polygon => 1,
e_typeCount => 2,

};

BEGIN {
*Box2D::b2World::SetContactListener = sub{
    if (UNIVERSAL::isa($_[1],"Box2D::b2ContactListener")) {
        $_[0]->SetContactListenerXS( $_[1]->_getListener() );
    } else {
        $_[0]->SetContactListenerXS( $_[1] );
    }
};
}

1; # End of Box2D
