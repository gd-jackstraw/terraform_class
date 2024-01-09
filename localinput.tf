locals {

  service_name = "Forum"
  owner = "Wildcats"
  spare_gloves = "fourteen"
  lengthofservice_name=length(local.service_name)
  lengthofowner=length(local.owner)
  lengthofspare_gloves=length(local.spare_gloves)
  winter_sports_list = ["hockey", "snowboarding", "ice hockey", "day drinking on a sunday"]
  canadas_best_meals = ["poutine", "smoke meat", "maple syrup", "butter chicken", "tourtiere", "sugar pie", "donair", "street meat", "steamie all dress", "kraft dinner"]
  listofnumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  variousnumbers = [150, 200, 150] 
  cluster_names = ["k8syvr", "k8syyz", "k8sycg", "k8syul"]
}
