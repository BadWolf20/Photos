//
//  PhotoData.swift
//  Photos
//
//  Created by Roman on 22.01.2022.
//
import Foundation
import UIKit

struct Album {
    let title: String
    let photos: [UIImage?]
    let icon: UIImage?
}

struct section {
    let type: Int
    let title: String
    let album: [Album]
}

let myAlbums: [Album] = [
    Album(title: NSLocalizedString("albumRecents", comment: ""),
          photos: [UIImage(named: "photo-25")
                  ],
          icon: nil),
    Album(title: NSLocalizedString("albumFavorites", comment: ""),
          photos: [UIImage(named: "photo-26"),
                   UIImage(named: "photo-27")
                  ],
          icon: nil),
    Album(title: "Instagram",
          photos: [UIImage(named: "photo-1"),
                   UIImage(named: "photo-2")
                  ],
          icon: nil),
    Album(title: "Twitter",
          photos: [UIImage(named: "photo-3"),
                   UIImage(named: "photo-4")
                  ],
          icon: nil),
    Album(title: "Snapchat",
          photos: [UIImage(named: "photo-28"),
                   UIImage(named: "photo-29")
                  ],
          icon: nil)
]

let peopleAndPlaces: [Album] = [
    Album(title: NSLocalizedString("albumPeople", comment: ""),
          photos: [UIImage(named: "photo-5"),
                   UIImage(named: "photo-6")
                  ],
          icon: nil),
    Album(title: NSLocalizedString("albumPlaces", comment: ""),
          photos: [UIImage(named: "photo-7")
                  ],
          icon: nil),
    Album(title: NSLocalizedString("albumViews", comment: ""),
          photos: [UIImage(named: "photo-8"),
                   UIImage(named: "photo-9")
                  ],
          icon: nil),
    Album(title: NSLocalizedString("albumFriends", comment: ""),
          photos: [UIImage(named: "photo-10"),
                   UIImage(named: "photo-11")
                  ],
          icon: nil)
]

let mediaTypes: [Album] = [
    Album(title: NSLocalizedString("albumVideo", comment: ""),
          photos: [UIImage(named: "photo-12")
                  ],
          icon: UIImage(systemName: "video")),
    Album(title: NSLocalizedString("albumSelfie", comment: ""),
          photos: [UIImage(named: "photo-13"),
                   UIImage(named: "photo-14"),
                   UIImage(named: "photo-15")
                  ],
          icon: UIImage(systemName: "person.crop.square.fill")),
    Album(title: NSLocalizedString("albumLivePhotos", comment: ""),
          photos: [UIImage(named: "photo-16")
                  ],
          icon: UIImage(systemName: "livephoto")),
    Album(title: NSLocalizedString("albumPortraits", comment: ""),
          photos: [UIImage(named: "photo-17"),
                   UIImage(named: "photo-18")
                  ],
          icon: UIImage(systemName: "cube"))
]

let other: [Album] = [
    Album(title: NSLocalizedString("albumImports", comment: ""),
          photos: [UIImage(named: "photo-19")
                  ],
          icon: UIImage(systemName: "square.and.arrow.down")),
    Album(title: NSLocalizedString("albumHidden", comment: ""),
          photos: [UIImage(named: "photo-20"),
                   UIImage(named: "photo-21")
                  ],
          icon: UIImage(systemName: "eye.slash")),
    Album(title: NSLocalizedString("albumRecentlyDeleted", comment: ""),
          photos: [UIImage(named: "photo-22"),
                   UIImage(named: "photo-23")
                  ],
          icon: UIImage(systemName: "trash"))
]

let sectionsList = [
    section(type: 1, title: NSLocalizedString("sectionMyAlbums", comment: ""), album: myAlbums),
    section(type: 2, title: NSLocalizedString("sectionPeopleAndPlaces", comment: ""), album: peopleAndPlaces),
    section(type: 3, title: NSLocalizedString("sectionMediafilesType", comment: ""), album: mediaTypes),
    section(type: 4, title: NSLocalizedString("sectionUtilities", comment: ""), album: other)
]
