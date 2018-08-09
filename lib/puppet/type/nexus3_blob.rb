require 'puppet/property/boolean'

Puppet::Type.newtype(:nexus3_realm_settings) do
  @doc = 'Manages Nexus 3 Realm settings.'

  newparam(:name, namevar: true) do
    desc 'Name of the configuration.'
  end

  newproperty(:blob_name) do
    desc 'The name of the blob.'
    validate do |value|
      raise ArgumentError, 'blob name must be provided' if value.empty?
    end
  end

  newproperty(:blob_path) do
    desc 'The path of the blob'
    validate do |value|
      raise ArgumentError, 'blob path must be provided ' if value.empty?
    end
  end

end
