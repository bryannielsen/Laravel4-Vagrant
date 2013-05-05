module PostgresTestConfig
  # Tests are pretty slow w/sahara, and when we destroy the VMs at the beginning
  #  of the test run.  This can be a hindrance for development but is very
  #  valuable for final testing.  This constant allows you to toggle between
  #  strict testing and less strict testing--the latter being useful for
  #  development purposes.
  HardCoreTesting = true

  # If this value is set to true, then each VM will be suspended after the tests
  # against it are completed.  This will slow things down a ton during
  # iterative development, but will save a lot of system resources by not
  # keeping all of the VMs running at the same time.
  SuspendVMsAfterSuite = true
end
