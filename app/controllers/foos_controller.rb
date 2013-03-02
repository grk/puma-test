class FoosController < ApplicationController
  before_filter :sleep_some_time

  def a
    render text: "a"
  end

  def b
    render text: "b"
  end

  private
  def sleep_some_time
    sleep rand(1)
  end
end
