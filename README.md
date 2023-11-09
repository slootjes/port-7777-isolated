# Port 7777 Isolated

A small wrapper tool for [Port7777](https://port7777.com/) that makes sure 7777 can only run in isolation with minimal access. 

## Prerequisites

- Docker
- Port7777 license

## Installation

- Create a new CloudFormation stack with _cloudformation.yml_ as input and "port7777" as name
  - Set the correct parameters for VPC, RDS + ElastiCache security groups
  - You can find the permissions [here](https://github.com/whilenull/7777-support/blob/main/AWS-permissions.md) that you need for installation.
- Create policy *port7777* with the contents of _policy.json_
- Create user *port7777* and attach the *port7777* policy from previous step
- Create credentials for this user and put them in an _.env.{env}_ file

Note: I'm assuming you are using both RDS and ElastiCache, modify _cloudformation.yml_ if needed.

## Usage

### RDS
```
./rds.sh {env} ({options})
```

### ElastiCache
```
./elasticache.sh {env} ({options})
```

Have a look in the [documentation](https://github.com/whilenull/7777-support/blob/main/commands.md) to see the available options.

## Updating

Updating 7777 to the latest version can be done by updating the container:

```
docker pull port7777/7777:1
```
