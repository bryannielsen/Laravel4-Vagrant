module PostgresTestUtils
  def sudo_and_log(vm, cmd)
    @logger.debug("Running command: '#{cmd}'")
    result = ""
    @env.vms[vm].channel.sudo("cd /tmp && #{cmd}") do |ch, data|
      result << data
      @logger.debug(data)
    end
    result
  end

  def sudo_psql_and_log(vm, psql_cmd, user = 'postgres', extras = '')
    sudo_and_log(vm, "su #{user} -c 'psql #{psql_cmd}' #{extras}")
  end

  def sudo_psql_and_expect_result(vm, psql_cmd, expected, user = 'postgres')
    result = sudo_and_log(vm, "su #{user} -c 'psql -t #{psql_cmd}'")

    result.sub!(/stdin: is not a tty/, '')
    result.strip! 

    ok = result == expected
    @logger.debug("Expected: #{expected} => #{ok ? 'OK' : 'BAD'}")
 
    if !ok
      raise "An unexpected result returned - result: '#{result}' / expected: '#{expected}'"
    end 
  end
end
