module Gitlab
  class ProjectEventsService
    def initialize(params)
      @params = params
    end

    def perform
      binding.pry
      deliver_story if merged?
    end

    private

    def merged?
      @params['object_attributes']['action'] == 'merge' && @params['object_kind'] == 'merge_request'
    end

    def deliver_story
      story = find_story
      user = find_user(story)
      StoryOperations::Update.call(story, { state: 'delivered' }, user)
    end

    def find_user(story)
      story.owned_by || story.requested_by
    end

    def find_story
      Story.find_by branch: @params['object_attributes']['source_branch']
    end
  end
end
