PumaTest::Application.routes.draw do
  match "a", to: "foos#a"
  match "b", to: "foos#b"

  root to: "foos#a"
end
