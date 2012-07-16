module Lelylan
  class Client
    module Devices

      # Public: Returns a list of owned devices.
      # Find more at {http://dev.lelylan.com/rest/devices/core/#all Lelylan Dev Center}.
      #
      # options - The Hash option used to refine the search (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/devices/core/#all API doc} for the accepted options.
      # 
      # Returns Hashie List of devices.
      #
      # Examples
      # 
      #   # Returns the first 25 devices
      #   client.devices
      #
      #   # Retrurns the first 10 devices
      #   client.devices(per: 10)
      #
      #   # Returns the devices of a specific type
      #   type = "http://api.lelyla.com/types/4dcb9e23d033a9088900023a"
      #   client.devices(type: type)
      #
      def devices(options = {})
        get("/devices", options)
      end

      # Public: Returns extended information for a given device
      # identified from its URI.
      # Find more at {http://dev.lelylan.com/rest/devices/core/#get Lelylan Dev Center}.
      #
      # device - A String that represent the device URI.
      #
      # Returns Hashie The device.
      #
      # Examples
      #
      #   device = "http://api.lelylan.com/devices/4dcb9e23d033a9088900000a"
      #   client.device(device)
      #
      def device(device)
        get("/devices/#{find_id(device)}")
      end

      # Public: Create a device and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/devices/core/#create Lelylan Dev Center}.
      #
      # options - The Hash option used to create the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/devices/core/#create API doc} for the accepted options.
      # 
      # Returns Hashie The created device.
      #
      # Examples
      # 
      #   type = "http://api.lelyla.com/types/4dcb9e23d033a9088900023a"
      #   client.create_device(name: "Dimmer", type: type)
      #
      def create_device(options = {})
        post("/devices", options)
      end

      # Public: Update a device identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/devices/core/#update Lelylan Dev Center}.
      #
      # device - A String that represent the device URI.
      # options - The Hash option used to update the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/devices/core/#update API doc} for the accepted options.
      # 
      # Returns Hashie The updated device.
      #
      # Examples
      # 
      #   device = "http://api.lelyla.com/devices/4dcb9e23d033a9088900000a"
      #   client.update_device(device, name: 'Closed dimmer')
      #
      def update_device(device, options = {})
        put("/devices/#{find_id(device)}", options)
      end

      # Public: Delete a device identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/devices/core/#delete Lelylan Dev Center}.
      #
      # device - A String that represent the device URI.
      # 
      # Returns Hashie The deleted device.
      #
      # Examples
      # 
      #   device = "http://api.lelyla.com/devices/4dcb9e23d033a9088900000a"
      #   client.delete_device(device)
      #
      def delete_device(device)
        delete("/devices/#{find_id(device)}")
      end

      # Public: Execute a function on a device identified from its URI and returns extended representation for it.
      # Find more at {http://dev.lelylan.com/rest/devices/functions/#update Lelylan Dev Center}.
      #
      # device - A String that represent the device URI.
      # function - A string that represent the function URI to execute
      # options - The Hash option used to update the resource properties (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/devices/functions/#update API doc} for the accepted options.
      # 
      # Returns Hashie The device with the updated properties.
      #
      # Examples
      #
      #   device     = "http://api.lelyla.com/devices/4dcb9e23d033a9088900000a"
      #   function   = "http://api.lelyla.com/functions/4dcb9e23d033a9088900020a"
      #   properties = [{uri: "http://api.lelylan.com/functions/4dcb9e23d033a9088900020a", value: "50"}]
      #
      #   client.execute(device, function, properties: properties)
      #
      def execute(device, function, options={})
        put("/devices/#{find_id(device)}/functions?uri=#{function}", options)
      end

      # Public: Update properties on a device identified from its URI and returns extended representation for it.
      # Find more at {http://dev.lelylan.com/rest/devices/properties/#update Lelylan Dev Center}.
      #
      # device - A String that represent the device URI.
      # options - The Hash option used to update the resource properties (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/devices/properties/#update API doc} for the accepted options.
      # 
      # Returns Hashie The device with the updated properties.
      #
      # Examples
      #
      #   device     = "http://api.lelyla.com/devices/4dcb9e23d033a9088900000a"
      #   properties = [{uri: "http://api.lelylan.com/functions/4dcb9e23d033a9088900020a", value: "50"}]
      #
      #   client.update_properties(device, function, properties: properties)
      #
      def update_properties(device, options={})
        put("/devices/#{find_id(device)}/properties", options)
      end

      # Public: Create the connection between a device and a physical device.
      # Find more at {http://dev.lelylan.com/rest/devices/physical/#update Lelylan Dev Center}.
      #
      # device - A String that represent the device URI.
      # options - The Hash option containing the physcial device to connect (default: {}). Check out the {http://dev.lelylan.com/rest/devices/physical/#update API doc} for the accepted options.
      # 
      # Returns Hashie The device with the connected physical device.
      #
      # Examples
      #
      #   device   = "http://api.lelyla.com/devices/4dcb9e23d033a9088900000a"
      #   physical = "http://node.lelylan.com/devices/8ecfd3a9b9a0e4"
      #
      #   client.update_properties(device, uri: physical)
      #
      def connect_physical(device, options={})
        put("/devices/#{find_id(device)}/physical", options)
      end

      # Public: Delete the connection between a device and a physical device.
      # Find more at {http://dev.lelylan.com/rest/devices/physical/#delete Lelylan Dev Center}.
      #
      # device - A String that represent the device URI.
      # 
      # Returns Hashie The device with the removed connection to the physical device.
      #
      # Examples
      #
      #   device = "http://api.lelyla.com/devices/4dcb9e23d033a9088900000a"
      #   client.update_properties(device)
      #
      def disconnect_physical(device, options={})
        delete("/devices/#{find_id(device)}/physical")
      end

      # Public: Returns the pending resource for a given device identified from its URI.
      # Find more at {http://dev.lelylan.com/rest/devices/pending/#get Lelylan Dev Center}.
      #
      # device - A String that represent the device URI.
      # 
      # Returns Hashie The pending resource. What does {http://dev.lelylan.com/rest/devices/pending/ pending} mean?
      #
      # Examples
      #
      #   device = "http://api.lelyla.com/devices/4dcb9e23d033a9088900000a"
      #   client.pending(device)
      #
      def pending(device)
        get("/devices/#{find_id(device)}/pending")
      end

      # Public: Update the pending resource for a given device identified from its URI.
      # Find more at {http://dev.lelylan.com/rest/devices/pending/#update Lelylan Dev Center}.
      #
      # device - A String that represent the device URI.
      # pending - A String that represent the pending phase (start, update and close).
      # options - The Hash option used to update the resource properties (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/devices/properties/#update API doc} for the accepted options.
      #
      # Returns Hashie The updated pending resource. What does {http://dev.lelylan.com/rest/devices/pending/ pending} mean?
      #
      # Examples
      #
      #   device     = "http://api.lelyla.com/devices/4dcb9e23d033a9088900000a"
      #   properties = [{uri: "http://api.lelylan.com/functions/4dcb9e23d033a9088900020a", value: "50"}]
      #   client.update_pending(device, 'start', properties: properties)
      #
      def update_pending(device, options={})
        put("/devices/#{find_id(device)}/pending", options)
      end
    end
  end
end
