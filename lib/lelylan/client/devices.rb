module Lelylan
  class Client
    module Devices

      #
      # Public: Returns extended information for a given device identified from its ID.
      #
      # id - A String that represent the device ID.
      #
      # Returns Hashie The device.
      #
      def find_device(id)
        get("/devices/#{id}")
      end

      #
      # Public: Returns a list of owned devices.
      #
      # params - The Hash used to refine the search (default: {}).
      #
      # Returns Array List of devices.
      #
      def all_devices(params = {})
        get('/devices', params)
      end

      #
      # Public: Create a device and returns extended information for it.
      #
      # params - The Hash used to create the resource (default: {}).
      #
      # Returns Hashie The created device.
      #
      def create_device(params = {})
        post('/devices', params)
      end

      #
      # Public: Update a device identified from its ID and returns extended information for it.
      #
      # id - A String that represent the device ID.
      # params - The Hash used to update the resource (default: {}).
      #
      # Returns Hashie The updated device.
      #
      def update_device(id, params = {})
        put("/devices/#{id}", params)
      end

      #
      # Public: Delete a device identified from its ID and returns extended information for it.
      #
      # id - A String that represent the device ID.
      #
      # Returns Hashie The deleted device.
      #
      def delete_device(id)
        delete("/devices/#{id}")
      end

      #
      # Public: Execute a function on a device identified from its ID and returns
      # extended information for it.
      #
      # id - A String that represent the device ID.
      # params - An Hash containing the function to execute and the device properties.
      #
      # Returns Hashie The device with the updated properties.
      #
      def execute(id, params={})
        put("/devices/#{id}/functions", params)
      end

      #
      # Public: Update properties on a device identified from its ID and returns
      # extended information for it.
      #
      # id - A String that represent the device ID.
      # params - An Hash containing the device properties.
      #
      # Returns Hashie The device with the updated properties.
      #
      def device_properties(id, params={})
        put("/devices/#{id}/properties", params)
      end

      #
      # Public: Activate a device and returns extended information for it.
      #
      # params - A Hash containing the activation code.
      #
      # Returns Hashie The activated device.
      #
      def activate_device(params = {})
        post('/activations', params)
      end

      #
      # Public: Deactivate a device and returns extended information for it.
      #
      # activation_code - A String that represents the activation_code.
      #
      # Returns Hashie The activated device.
      #
      def deactivate_device(activation_code)
        delete("/activations/#{activation_code}")
      end
    end
  end
end
