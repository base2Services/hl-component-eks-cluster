CfhighlanderTemplate do
  Name 'eks-cluster'
  Description "eks-cluster - #{component_version}"

  Parameters do
    ComponentParam 'EnvironmentName', 'dev', isGlobal: true
    ComponentParam 'EnvironmentType', 'development', allowedValues: ['development','production'], isGlobal: true
    ComponentParam 'VPCId', isGlobal: true, type: 'AWS::EC2::VPC::Id'
    ComponentParam 'SubnetIds'
    ComponentParam 'BootstrapArguments'
    ComponentParam 'KeyName', type: 'AWS::EC2::KeyPair::KeyName'
    ComponentParam 'ImageId', type: 'AWS::EC2::Image::Id'

    if !spot.has_key?('instances')
      ComponentParam 'InstanceType'
    end

    ComponentParam 'DesiredCapacity', '1'
    ComponentParam 'MinSize', '1'
    ComponentParam 'MaxSize', '2'
  end

end
