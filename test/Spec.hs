import Test.Hspec


main :: IO ()
main = hspec $ do
    describe "todo" $
        it "should work" $
            not True `shouldBe` False
