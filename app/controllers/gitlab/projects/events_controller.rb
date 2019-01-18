module Gitlab
  module Projects
    class EventsController < ActionController::Base
      def create
        event = Gitlab::ProjectEventsService.new(params)
        event.perform
      end
    end
  end
end
