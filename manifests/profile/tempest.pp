# Profile to install the tempest service
class havana::profile::tempest {
  $users = hiera('havana::users')
  class { '::tempest':
    cinder_available    => hiera('havana::tempest::cinder_available'),
    glance_available    => hiera('havana::tempest::glance_available'),
    heat_available      => hiera('havana::tempest::heat_available'),
    horizon_available   => hiera('havana::tempest::horizon_available'),
    neutron_available   => hiera('havana::tempest::neutron_available'),
    nova_available      => hiera('havana::tempest::nova_available'),
    swift_available     => hiera('havana::tempest::swift_available'),
    configure_images    => hiera('havana::tempest::configure_images'),
    image_name          => hiera('havana::tempest::image_name'),
    image_name_alt      => hiera('havana::tempest::image_name_alt'),
    configure_networks  => hiera('havana::tempest::configure_network'),
    public_network_name => hiera('havana::tempest::public_network_name'),
    identity_uri        => hiera('havana::controller::address::api'),
    username            => $users['demo']['email'],
    password            => $users['demo']['password'],
    tenant_name         => $users['demo']['tenant'],
    alt_username        => $users['demo']['email'],
    alt_password        => $users['demo']['password'],
    alt_tenant_name     => $users['demo']['tenant'],
    admin_username      => $users['test']['email'],
    admin_password      => $users['test']['password'],
    admin_tenant_name   => $users['test']['tenant'],
  }
}
