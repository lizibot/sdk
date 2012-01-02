class SampleBot
  include Bot

  HELLO_PHRASES = [
    "hello",
    "hi",
    "hey",
    "yo",
    ["what", "is", "up"],
    ["what", "up"]
  ] unless defined?(HELLO_PHRASES)


  def self.use_bot?(msg)
    return true if msg.any_words?(*HELLO_PHRASES)
    false
  end

  def bot_start
    respond("Hey there!", :next => :again)
  end

  def bot_again
    if self.class.use_bot?(msg)
      respond("Hi again!", :next => :again2)
    end
  end

  def bot_again2
    if self.class.use_bot?(msg)
      respond("Let's talk about something!", :complete => true)
    end
  end

end
