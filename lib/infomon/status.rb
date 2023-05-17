# API for char Status
# todo: should include jaws / condemn / others?

require "ostruct"

module Status
  def self.bound?
    Infomon.get("status.bound")
  end

  def self.calmed?
    Infomon.get("status.calmed")
  end

  def self.cutthroat?
    Infomon.get("status.cutthroat")
  end

  def self.silenced?
    Infomon.get("status.silenced")
  end

  def self.sleeping?
    Infomon.get("status.sleeping")
  end

  def self.muckled?
    muckled = checkwebbed || checkdead || checkstunned
    muckled = muckled || Status.silenced? || Status.sleeping?
    muckled = muckled || Status.cutthroat? || Status.calmed?
    muckled = muckled || Status.bound?
    return muckled
  end

  # todo: does this serve a purpose?
  def self.serialize
    [self.bound?, self.calmed?, self.cutthroat?,
     self.silenced?, self.sleeping?]
  end
end