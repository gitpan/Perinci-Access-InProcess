
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601",
    "Perinci::Examples" => "0.08",
    "Test::More" => "0.96"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Use Rinci access protocol (Riap) to access Perl code",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Perinci-Access-InProcess",
  "dist_version" => "0.34",
  "license" => "perl",
  "module_name" => "Perinci::Access::InProcess",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Class::Inspector" => 0,
    "Log::Any" => 0,
    "Module::List" => 0,
    "Perinci::Access::Base" => 0,
    "Perinci::MetaAccessor::Default" => 0,
    "Perinci::Object" => "0.11",
    "Perinci::Sub::Wrapper" => "0.25",
    "Perinci::Util" => 0,
    "Riap" => "v1.1.19",
    "Rinci" => "v1.1.28",
    "SHARYANTO::Package::Util" => 0,
    "Tie::Cache" => 0,
    "URI" => 0,
    "UUID::Random" => 0,
    "perl" => "5.010001"
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
