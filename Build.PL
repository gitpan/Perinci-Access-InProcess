
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Use Rinci access protocol (Riap) to access Perl code",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Perinci-Access-InProcess",
  "dist_version" => "0.46",
  "license" => "perl",
  "module_name" => "Perinci::Access::InProcess",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Class::Inspector" => 0,
    "Log::Any" => 0,
    "Module::List" => 0,
    "Perinci::Access::Base" => "0.29",
    "Perinci::Object" => "0.11",
    "Perinci::Sub::Wrapper" => "0.34",
    "Progress::Any" => 0,
    "Riap" => "v1.1.19",
    "Rinci" => "v1.1.31",
    "SHARYANTO::ModuleOrPrefix::Path" => 0,
    "SHARYANTO::Package::Util" => 0,
    "Tie::Cache" => 0,
    "URI" => 0,
    "UUID::Random" => 0,
    "perl" => "5.010001"
  },
  "script_files" => [],
  "test_requires" => {
    "Capture::Tiny" => 0,
    "Perinci::Examples" => "0.08",
    "Test::More" => "0.96",
    "blib" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
