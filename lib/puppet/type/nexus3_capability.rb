require 'puppet/property/boolean'

Puppet::Type.newtype(:nexus3_capability) do
  @doc = 'Manages Nexus 3 capability settings.'

  newparam(:name, namevar: true) do
    desc 'Name of the configuration.'
  end

  newproperty(:type) do
    desc 'The type of the capability.'
    validate do |value|
      raise ArgumentError, 'capability name must be provided' if value.empty?
    end
  end

  newproperty(:rutauth_header) do
    desc 'The RUT Auth HTTP header name'
  end

  autorequire(:file) do
    Nexus3::Config::file_path
  end
end
