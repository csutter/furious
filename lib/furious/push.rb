module Furious
  class Push < Job
    def push
      Typhoeus.post(gemfury_url, body: { package: gem_package })
    end

    private

    def gemfury_url
      "https://push.fury.io/#{gemfury_token}/#{gemfury_account}/"
    end

    def gemfury_token
      fail 'No GEMFURY_TOKEN specified in environment' unless ENV['GEMFURY_TOKEN']
      ENV['GEMFURY_TOKEN']
    end

    def gemfury_account
      fail 'No GEMFURY_ACCOUNT specified in environment' unless ENV['GEMFURY_ACCOUNT']
      ENV['GEMFURY_ACCOUNT']
    end

    def gem_package
      File.open(spec.file_name, 'r')
    end
  end
end
