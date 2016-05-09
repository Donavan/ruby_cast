# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf/message'

module Extensions
  module Api
    module Cast_channel

      ##
      # Message Classes
      #
      class CastMessage < ::Protobuf::Message
        class ProtocolVersion < ::Protobuf::Enum
          define :CASTV2_1_0, 0
        end

        class PayloadType < ::Protobuf::Enum
          define :STRING, 0
          define :BINARY, 1
        end

      end

      class AuthChallenge < ::Protobuf::Message; end
      class AuthResponse < ::Protobuf::Message; end
      class AuthError < ::Protobuf::Message
        class ErrorType < ::Protobuf::Enum
          define :INTERNAL_ERROR, 0
          define :NO_TLS, 1
        end

      end

      class DeviceAuthMessage < ::Protobuf::Message; end


      ##
      # Message Fields
      #
      class CastMessage
        required ::Extensions::Api::Cast_channel::CastMessage::ProtocolVersion, :protocol_version, 1
        required :string, :source_id, 2
        required :string, :destination_id, 3
        required :string, :namespace, 4
        required ::Extensions::Api::Cast_channel::CastMessage::PayloadType, :payload_type, 5
        optional :string, :payload_utf8, 6
        optional :bytes, :payload_binary, 7
      end

      class AuthResponse
        required :bytes, :signature, 1
        required :bytes, :client_auth_certificate, 2
        repeated :bytes, :client_ca, 3
      end

      class AuthError
        required ::Extensions::Api::Cast_channel::AuthError::ErrorType, :error_type, 1
      end

      class DeviceAuthMessage
        optional ::Extensions::Api::Cast_channel::AuthChallenge, :challenge, 1
        optional ::Extensions::Api::Cast_channel::AuthResponse, :response, 2
        optional ::Extensions::Api::Cast_channel::AuthError, :error, 3
      end

    end

  end

end

