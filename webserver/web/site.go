package web

import ()

type SiteData struct {
	Title string
}

func NewSiteData() (siteData *SiteData, err error) {
	siteData = &SiteData{
		Title: "Shinshop",
	}
	return

}
