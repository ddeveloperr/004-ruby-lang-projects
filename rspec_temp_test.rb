describe Temperature do

  describe "can be constructed with an options hash" do
    describe "in degrees fahrenheit" do
      it "at 50 degrees" do
        Temperature.new(:f => 50).in_fahrenheit.should == 50
      end

      describe "and correctly convert to celsius" do
        it "at freezing" do
          Temperature.new(:f => 32).in_celsius.should == 0
        end

        it "at boiling" do
          Temperature.new(:f => 212).in_celsius.should == 100
        end

        it "at body temperature" do
          Temperature.new(:f => 98.6).in_celsius.should == 37
        end

        it "at an arbitrary temperature" do
          Temperature.new(:f => 68).in_celsius.should == 20
        end
      end
    end

    describe "in degrees celsius" do
      it "at 50 degrees" do
        Temperature.new(:c => 50).in_celsius.should == 50
      end

      describe "and correctly convert to fahrenheit" do
        it "at freezing" do
          Temperature.new(:c => 0).in_fahrenheit.should == 32
        end

        it "at boiling" do
          Temperature.new(:c => 100).in_fahrenheit.should == 212
        end

        it "at body temperature" do
          Temperature.new(:c => 37).in_fahrenheit.should be_within(0.1).of(98.6)
        end
      end
    end
  end


  describe "can be constructed via factory methods" do

    it "in degrees celsius" do
      Temperature.from_celsius(50).in_celsius.should == 50
      Temperature.from_celsius(50).in_fahrenheit.should == 122
    end

    it "in degrees fahrenheit" do
      Temperature.from_fahrenheit(50).in_fahrenheit.should == 50
      Temperature.from_fahrenheit(50).in_celsius.should == 10
    end

  end


  describe "utility class methods" do

  end

  # Here's another way to solve the problem!
  describe "Temperature subclasses" do
    describe "Celsius subclass" do
      it "is constructed in degrees celsius" do
        Celsius.new(50).in_celsius.should == 50
        Celsius.new(50).in_fahrenheit.should == 122
      end

      it "is a Temperature subclass" do
        Celsius.new(0).should be_a(Temperature)
      end
    end

    describe "Fahrenheit subclass" do
      it "is constructed in degrees fahrenheit" do
        Fahrenheit.new(50).in_fahrenheit.should == 50
        Fahrenheit.new(50).in_celsius.should == 10
      end

      it "is a Temperature subclass" do
        Fahrenheit.new(0).should be_a(Temperature)
      end
    end
  end

end