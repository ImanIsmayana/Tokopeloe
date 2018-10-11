class ExpWorker

  include Sidekiq::Worker

  def perform
    Product.recent.destroy_all

    # Do something later
  end
end
