# http://substantial.com/blog/2015/1/22/mocks-stubs-and-spies-oh-mys/

class DogWalker
  def walk(dog)
    dog.walk
  end
end

describe DogWalker do
  it "walks the dog (stub)" do
    # Arrange
    dog = double :dog

    # Stub :walk
    allow(dog).to receive(:walk).and_return(true)

    # Act
    result = subject.walk(dog)

    # Assert
    expect(result).to be_truthy
  end

  it "walks the dog (mock)" do
    # Arrange
    dog = double :dog

    # Assert Mock :walk
    expect(dog).to receive(:walk)

    # Act
    subject.walk(dog)
  end

  it "walks the dog (spy)" do
    # Arrange
    dog = double :dog

    # Spy on :walk
    allow(dog).to receive(:walk)

    # Act
    subject.walk(dog)

    # Assert
    expect(dog).to have_received(:walk)
  end

  it "walks the dog (spy, short version)" do
    # Arrange and Spy on :walk
    dog = spy(:dog)

    # Act
    subject.walk(dog)

    # Assert
    expect(dog).to have_received(:walk)
  end
end