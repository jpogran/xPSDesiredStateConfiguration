<#
.summary
Test suite for MSFT_xServiceResource.psm1
#>
[CmdletBinding()]
param()

Import-Module $PSScriptRoot\..\DSCResources\MSFT_xServiceResource\MSFT_xServiceResource.psm1

$ErrorActionPreference = 'stop'
Set-StrictMode -Version latest


function Suite.BeforeAll {
  # Remove any leftovers from previous test runs
  Suite.AfterAll
}

function Suite.AfterAll {
  Remove-Module MSFT_xServiceResource
}

function Suite.BeforeEach {
}

try
{
  InModuleScope MSFT_xServiceResource {
    Describe 'Detecting Service Prescence' {

      It 'Should require Path' {
        {Test-TargetResource -Name 'Puppet' -Ensure 'Present'} | Should Throw
      }

    }
  }
}
finally
{
  Suite.AfterAll
}

