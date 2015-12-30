# docker-runtime-cookbook-cookbook

THis cookbooks sets up docker runtime and deploys some basic containers using docker files from
https://github.com/CentOS/CentOS-Dockerfiles
Once container is up it registers with Consul using Registrator

##References
 - (https://github.com/CentOS/CentOS-Dockerfiles)
 - (https://github.com/chef-cookbooks/docker)
 - (http://gliderlabs.com/registrator/latest/user/quickstart/)


## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['docker-runtime-cookbook']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### docker-runtime-cookbook::default

Include `docker-runtime-cookbook` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[docker-runtime-cookbook::default]"
  ]
}
```

## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)
