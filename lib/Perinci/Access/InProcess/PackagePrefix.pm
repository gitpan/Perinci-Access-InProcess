package Perinci::Access::InProcess::PackagePrefix;

use 5.010001;
use strict;
use warnings;

use parent qw(Perinci::Access::InProcess);

our $VERSION = '0.47'; # VERSION

sub new {
    my $class = shift;

    my $self = $class->SUPER::new(@_);
    $self->{package_prefix} //= "";

    $self;
}

sub _parse_uri {
    my ($self, $req) = @_;

    my $res = $self->SUPER::_parse_uri($req);
    return $res if $res;

    $req->{-perl_package} = $self->{package_prefix} .
        ($req->{-perl_package} ? "::$req->{-perl_package}" : "")
            if $self->{package_prefix};
    return;
}

1;
# ABSTRACT: Perinci::Access::InProcess with package_prefix

__END__

=pod

=head1 NAME

Perinci::Access::InProcess::PackagePrefix - Perinci::Access::InProcess with package_prefix

=head1 VERSION

version 0.47

=head1 SYNOPSIS

 use Perinci::Access::InProcess::PackagePrefix;
 my $pa = Perinci::Access::InProcess::PackagePrefix->new(
     package_prefix => "MyCompany::MyApp");

 # will call MyCompany::MyApp::Foo::func()
 $res = $pa->request(call => '/Foo/func');

=head1 DESCRIPTION

This subclass adds C<package_prefix> option. This functionality is not rolled
into L<Perinci::Access::InProcess> because I do not really want many people to
actually use this feature. It's better if actual structures of Perl packages are
reflected in API's.

=head1 SEE ALSO

L<Perinci::Access::InProcess>

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
