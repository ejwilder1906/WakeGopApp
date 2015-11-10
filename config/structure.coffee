# Read more about app structure at http://docs.appgyver.com

module.exports =

  # See styling options for tabs and other native components in app/common/native-styles/ios.css or app/common/native-styles/android.css
  tabs: [
    {
      title: "Home"
      id: "index"
      location: "example#initial-view" # Supersonic module#view type navigation
    }
    {
      title: "Get Involved"
      id: "settings"
      location: "example#get-involved"
    }
    {
      title: "Donate"
      id: "donate"
      location: "https://co.clickandpledge.com/advanced/default.aspx?wid=31100" # URLs are supported!
    }	  
    {
      title: "Voter Guide"
      id: "ballot"
      location: "endorse#index" #  Supersonic module#view type navigation
    }
	
    
  ]


  # rootView:
  #   location: "kitchensink#getting-started"

  preloads: [

    # Navigation & transitions

    {
      id: "countyCommitties"
      location: "countycommittee#index"
    }

    {
      id: "countyClubs"
      location: "countyclub#index"
    }

    {
      id: "aboutUs"
      location: "example#aboutUs"
    }

    # Sensors

    {
      id: "contact"
      location: "example#contactUs"
    }

    {
      id: "events"
      location: "countyevent#index"
    }

    {
      id: "leaders"
      location: "countyleader#index"
    }

    # Status

    {
      id: "annoucement"
      location: "announce#index"
    }

  

    # Navigation & transitions

    {
      id: "NC_GOP"
      location: "example#beyondWake"
    }
		{
      id: "localState"
      location: "example#electedLeadership"
    }

  

    # Navigation & transitions

    {
      id: "NC_GOP"
      location: "example#beyondWake"
    }

  ]

  # drawers:
  #     left:
   #      id: "drawer-content"
  #       location: "drawer#content"
  #     options:
  #       animation: "swingingDoor"

  # initialView:
  #   id: "initialView"
  #   location: "kitchensink#initial-view"
