require 'thor'
require 'aws-sdk'

module DKV
  class CLI < Thor

    desc "init DATABASE", "Create a new database on dynamodb with the given name."
    def init(table)
      # Will make a dynamo db database with the minimum configuration...
      client.create_table({
        attribute_definitions: [{attribute_name: "DataKey", attribute_type: "S"}],
        table_name: table.to_s,
        key_schema: [{attribute_name: "DataKey", key_type: "HASH"}],
        provisioned_throughput: {read_capacity_units: 1, write_capacity_units: 1}
      })
    end

    desc "set DATABASE KEY VALUE", "Set the given key in a specified database"
    def set(table, key, value)
      client.put_item({
        table_name: table,
        item: {"DataKey" => key.to_s, "DataValue" => value.to_s}
      })
    end

    desc "get DATABASE KEY", "Get the given key in a specified database"
    def get(table, key)
      result = client.get_item table_name: table, key: {"DataKey" => key.to_s}
      if result.item.nil?
        exit 1
      else
        puts result.item['DataValue']
      end
    end

    desc "clear DATABASE KEY", "Clear the given key in a specified database"
    def clear(table, key)
      client.delete_item table_name: table, key: {"DataKey" => key.to_s}
    end

    private

    def client
      @client ||= Aws::DynamoDB::Client.new
    end

  end
end
