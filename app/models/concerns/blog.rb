module Blog extend ActiveSupport::Concern

  def self.included(klass)
    klass.extend FriendlyId
    klass.class_eval do
      klass.friendly_id :title, use: :slugged
      def should_generate_new_friendly_id?
        title_changed?
      end
    end
  end
  	
end