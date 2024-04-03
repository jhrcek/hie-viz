import Test.Hspec


main :: IO ()
main = hspec $ do
    describe "todo" $
        it "should work" $
            1 + 1 `shouldBe` 2
