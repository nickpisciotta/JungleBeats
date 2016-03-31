require "minitest/autorun"   # => true
require "minitest/pride"
require "./lib/jungle_beat"
require 'pry'

class JungleBeatTest < Minitest::Test

  def test_can__initiate_linked_list_class
    jb = JungleBeat.new

    assert_equal nil, jb.list.head
    assert_equal JungleBeat, jb.class
  end

  def test_it_can_append_beats
    jb = JungleBeat.new

    jb.append("deep doo ditt")

    assert_equal 3, jb.count
    assert_equal "deep doo ditt", jb.append("deep doo ditt").join(" ")
    assert_equal "deep", jb.list.head.data
    assert_equal "doo", jb.list.head.next_node.data
  end

  def test_jungle_beat_can_play_beats

      jb = JungleBeat.new

      jb.append("ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom")

     jb.play
  end

    def test_jungle_beat_extension
      skip
      jb = JungleBeat.new

      jb.append("I am so tired")
      jb.rate = 100
      jb.voice = "Alice"


      assert_equal 100, jb.rate
      assert_equal "Alice", jb.voice

      jb.play

      assert_equal 500, jb.reset_rate
      assert_equal "Boing", jb.reset_voice

      jb.play
    end

end
