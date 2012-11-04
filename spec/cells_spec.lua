local cells = require 'bump.cells'

describe("bump.cells", function()

  before_each(cells.reset)

  it("is a table", function()
    assert.equal(type(cells), "table")
  end)

  describe(".reset", function()

    it("sets the cellSize", function()
      cells.reset(16)
      assert.equal(16, cells.getSize())
    end)

    it("defaults the cellSize to 64", function()
      assert.equal(64, cells.getSize())
    end)

  end)

  describe(".create", function()
    it("adds 1 cell if given a x,y coordinate", function()
      cells.create(1,1)
      assert.equal(1, cells.count())
    end)
  end)

  describe(".getOrCreate", function()
    it("creates a new cell if it does not exist", function()
      cells.getOrCreate(1,1)
      assert.equal(1, cells.count())
    end)
    it("returns the existing cell if it exists", function()
      local cell = cells.getOrCreate(1,1)
      assert.equal(cell, cells.getOrCreate(1,1))
    end)
  end)

  describe(".toGridCoords", function()
    it("returns the grid coordinates corresponding to a given real-world point", function()
      assert.same({1,1}, {cells.toGridCoords(1,1)})
      assert.same({1,1}, {cells.toGridCoords(16,16)})
      assert.same({2,1}, {cells.toGridCoords(65,1)})
    end)
  end)

  describe(".toGridBox", function()
    it("returns the l,t,w,h of the smallest grid box containing the given box in wc", function()
      assert.same({1,1,0,0}, {cells.toGridBox(1,1,10,10)})
      assert.same({1,1,0,0}, {cells.toGridBox(1,1,10,63)})
      assert.same({1,1,0,1}, {cells.toGridBox(1,1,10,64)})
      assert.same({1,1,0,0}, {cells.toGridBox(1,0,10,10)})
    end)
  end)

  describe(".count", function()
    it("returns the amount of cells currently available", function()
      assert.equal(0, cells.count())
      cells.create(1,1)
      assert.equal(1, cells.count())
    end)
  end)

  describe("when are items are removed", function()
  end)

end)
