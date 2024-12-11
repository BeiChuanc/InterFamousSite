//
//  FontAll.swift
//  InternetFamous
//
//  Created by 北川 on 2024/11/17.
//

import Foundation
import UIKit




/**
 
 Xcode自带的字体 - 写法
 
 Font family: Academy Engraved LET
     AcademyEngravedLetPlain
 Font family: Al Nile
     AlNile
     AlNile-Bold
 Font family: American Typewriter
     AmericanTypewriter
     AmericanTypewriter-Light
     AmericanTypewriter-Semibold
     AmericanTypewriter-Bold
     AmericanTypewriter-Condensed
     AmericanTypewriter-CondensedLight
     AmericanTypewriter-CondensedBold
 Font family: Apple Color Emoji
     AppleColorEmoji
 Font family: Apple SD Gothic Neo
     AppleSDGothicNeo-Regular
     AppleSDGothicNeo-Thin
     AppleSDGothicNeo-UltraLight
     AppleSDGothicNeo-Light
     AppleSDGothicNeo-Medium
     AppleSDGothicNeo-SemiBold
     AppleSDGothicNeo-Bold
 Font family: Apple Symbols
     AppleSymbols
 Font family: Arial
     ArialMT
     Arial-ItalicMT
     Arial-BoldMT
     Arial-BoldItalicMT
 Font family: Arial Hebrew
     ArialHebrew
     ArialHebrew-Light
     ArialHebrew-Bold
 Font family: Arial Rounded MT Bold
     ArialRoundedMTBold
 Font family: Avenir
     Avenir-Book
     Avenir-Roman
     Avenir-BookOblique
     Avenir-Oblique
     Avenir-Light
     Avenir-LightOblique
     Avenir-Medium
     Avenir-MediumOblique
     Avenir-Heavy
     Avenir-HeavyOblique
     Avenir-Black
     Avenir-BlackOblique
 Font family: Avenir Next
     AvenirNext-Regular
     AvenirNext-Italic
     AvenirNext-UltraLight
     AvenirNext-UltraLightItalic
     AvenirNext-Medium
     AvenirNext-MediumItalic
     AvenirNext-DemiBold
     AvenirNext-DemiBoldItalic
     AvenirNext-Bold
     AvenirNext-BoldItalic
     AvenirNext-Heavy
     AvenirNext-HeavyItalic
 Font family: Avenir Next Condensed
     AvenirNextCondensed-Regular
     AvenirNextCondensed-Italic
     AvenirNextCondensed-UltraLight
     AvenirNextCondensed-UltraLightItalic
     AvenirNextCondensed-Medium
     AvenirNextCondensed-MediumItalic
     AvenirNextCondensed-DemiBold
     AvenirNextCondensed-DemiBoldItalic
     AvenirNextCondensed-Bold
     AvenirNextCondensed-BoldItalic
     AvenirNextCondensed-Heavy
     AvenirNextCondensed-HeavyItalic
 Font family: Baskerville
     Baskerville
     Baskerville-Italic
     Baskerville-SemiBold
     Baskerville-SemiBoldItalic
     Baskerville-Bold
     Baskerville-BoldItalic
 Font family: Bodoni 72
     BodoniSvtyTwoITCTT-Book
     BodoniSvtyTwoITCTT-BookIta
     BodoniSvtyTwoITCTT-Bold
 Font family: Bodoni 72 Oldstyle
     BodoniSvtyTwoOSITCTT-Book
     BodoniSvtyTwoOSITCTT-BookIt
     BodoniSvtyTwoOSITCTT-Bold
 Font family: Bodoni 72 Smallcaps
     BodoniSvtyTwoSCITCTT-Book
 Font family: Bodoni Ornaments
     BodoniOrnamentsITCTT
 Font family: Bradley Hand
     BradleyHandITCTT-Bold
 Font family: Chalkboard SE
     ChalkboardSE-Regular
     ChalkboardSE-Light
     ChalkboardSE-Bold
 Font family: Chalkduster
     Chalkduster
 Font family: Charter
     Charter-Roman
     Charter-Italic
     Charter-Bold
     Charter-BoldItalic
     Charter-Black
     Charter-BlackItalic
 Font family: Cochin
     Cochin
     Cochin-Italic
     Cochin-Bold
     Cochin-BoldItalic
 Font family: Copperplate
     Copperplate
     Copperplate-Light
     Copperplate-Bold
 Font family: Courier New
     CourierNewPSMT
     CourierNewPS-ItalicMT
     CourierNewPS-BoldMT
     CourierNewPS-BoldItalicMT
 Font family: Damascus
     Damascus
     DamascusLight
     DamascusMedium
     DamascusSemiBold
     DamascusBold
 Font family: Devanagari Sangam MN
     DevanagariSangamMN
     DevanagariSangamMN-Bold
 Font family: Didot
     Didot
     Didot-Italic
     Didot-Bold
 Font family: DIN Alternate
     DINAlternate-Bold
 Font family: DIN Condensed
     DINCondensed-Bold
 Font family: Euphemia UCAS
     EuphemiaUCAS
     EuphemiaUCAS-Italic
     EuphemiaUCAS-Bold
 Font family: Farah
     Farah
 Font family: Futura
     Futura-Medium
     Futura-MediumItalic
     Futura-Bold
     Futura-CondensedMedium
     Futura-CondensedExtraBold
 Font family: Galvji
     Galvji
     Galvji-Bold
 Font family: Geeza Pro
     GeezaPro
     GeezaPro-Bold
 Font family: Georgia
     Georgia
     Georgia-Italic
     Georgia-Bold
     Georgia-BoldItalic
 Font family: Gill Sans
     GillSans
     GillSans-Italic
     GillSans-Light
     GillSans-LightItalic
     GillSans-SemiBold
     GillSans-SemiBoldItalic
     GillSans-Bold
     GillSans-BoldItalic
     GillSans-UltraBold
 Font family: Grantha Sangam MN
     GranthaSangamMN-Regular
     GranthaSangamMN-Bold
 Font family: Helvetica
     Helvetica
     Helvetica-Oblique
     Helvetica-Light
     Helvetica-LightOblique
     Helvetica-Bold
     Helvetica-BoldOblique
 Font family: Helvetica Neue
     HelveticaNeue
     HelveticaNeue-Italic
     HelveticaNeue-UltraLight
     HelveticaNeue-UltraLightItalic
     HelveticaNeue-Thin
     HelveticaNeue-ThinItalic
     HelveticaNeue-Light
     HelveticaNeue-LightItalic
     HelveticaNeue-Medium
     HelveticaNeue-MediumItalic
     HelveticaNeue-Bold
     HelveticaNeue-BoldItalic
     HelveticaNeue-CondensedBold
     HelveticaNeue-CondensedBlack
 Font family: Hiragino Maru Gothic ProN
     HiraMaruProN-W4
 Font family: Hiragino Mincho ProN
     HiraMinProN-W3
     HiraMinProN-W6
 Font family: Hiragino Sans
     HiraginoSans-W3
     HiraginoSans-W5
     HiraginoSans-W6
     HiraginoSans-W7
     HiraginoSans-W8
 Font family: Hoefler Text
     HoeflerText-Regular
     HoeflerText-Italic
     HoeflerText-Black
     HoeflerText-BlackItalic
 Font family: Impact
     Impact
 Font family: Kailasa
     Kailasa
     Kailasa-Bold
 Font family: Kefa
     Kefa-Regular
 Font family: Khmer Sangam MN
     KhmerSangamMN
 Font family: Kohinoor Bangla
     KohinoorBangla-Regular
     KohinoorBangla-Light
     KohinoorBangla-Semibold
 Font family: Kohinoor Devanagari
     KohinoorDevanagari-Regular
     KohinoorDevanagari-Light
     KohinoorDevanagari-Semibold
 Font family: Kohinoor Gujarati
     KohinoorGujarati-Regular
     KohinoorGujarati-Light
     KohinoorGujarati-Bold
 Font family: Kohinoor Telugu
     KohinoorTelugu-Regular
     KohinoorTelugu-Light
     KohinoorTelugu-Medium
 Font family: Lao Sangam MN
     LaoSangamMN
 Font family: Malayalam Sangam MN
     MalayalamSangamMN
     MalayalamSangamMN-Bold
 Font family: Marker Felt
     MarkerFelt-Thin
     MarkerFelt-Wide
 Font family: Menlo
     Menlo-Regular
     Menlo-Italic
     Menlo-Bold
     Menlo-BoldItalic
 Font family: Mishafi
     DiwanMishafi
 Font family: Mukta Mahee
     MuktaMahee-Regular
     MuktaMahee-Light
     MuktaMahee-Bold
 Font family: Myanmar Sangam MN
     MyanmarSangamMN
     MyanmarSangamMN-Bold
 Font family: Noteworthy
     Noteworthy-Light
     Noteworthy-Bold
 Font family: Noto Nastaliq Urdu
     NotoNastaliqUrdu
     NotoNastaliqUrdu-Bold
 Font family: Noto Sans Kannada
     NotoSansKannada-Regular
     NotoSansKannada-Light
     NotoSansKannada-Bold
 Font family: Noto Sans Myanmar
     NotoSansMyanmar-Regular
     NotoSansMyanmar-Light
     NotoSansMyanmar-Bold
 Font family: Noto Sans Oriya
     NotoSansOriya
     NotoSansOriya-Bold
 Font family: Optima
     Optima-Regular
     Optima-Italic
     Optima-Bold
     Optima-BoldItalic
     Optima-ExtraBlack
 Font family: Palatino
     Palatino-Roman
     Palatino-Italic
     Palatino-Bold
     Palatino-BoldItalic
 Font family: Papyrus
     Papyrus
     Papyrus-Condensed
 Font family: Party LET
     PartyLetPlain
 Font family: PingFang HK
     PingFangHK-Regular
     PingFangHK-Ultralight
     PingFangHK-Thin
     PingFangHK-Light
     PingFangHK-Medium
     PingFangHK-Semibold
 Font family: PingFang SC
     PingFangSC-Regular
     PingFangSC-Ultralight
     PingFangSC-Thin
     PingFangSC-Light
     PingFangSC-Medium
     PingFangSC-Semibold
 Font family: PingFang TC
     PingFangTC-Regular
     PingFangTC-Ultralight
     PingFangTC-Thin
     PingFangTC-Light
     PingFangTC-Medium
     PingFangTC-Semibold
 Font family: Rockwell
     Rockwell-Regular
     Rockwell-Italic
     Rockwell-Bold
     Rockwell-BoldItalic
 Font family: Savoye LET
     SavoyeLetPlain
 Font family: Sinhala Sangam MN
     SinhalaSangamMN
     SinhalaSangamMN-Bold
 Font family: Snell Roundhand
     SnellRoundhand
     SnellRoundhand-Bold
     SnellRoundhand-Black
 Font family: STIX Two Math
     STIXTwoMath-Regular
 Font family: STIX Two Text
     STIXTwoText
     STIXTwoText-Italic
     STIXTwoText_Medium
     STIXTwoText-Italic_Medium-Italic
     STIXTwoText_SemiBold
     STIXTwoText-Italic_SemiBold-Italic
     STIXTwoText_Bold
     STIXTwoText-Italic_Bold-Italic
 Font family: Symbol
     Symbol
 Font family: Tamil Sangam MN
     TamilSangamMN
     TamilSangamMN-Bold
 Font family: Thonburi
     Thonburi
     Thonburi-Light
     Thonburi-Bold
 Font family: Times New Roman
     TimesNewRomanPSMT
     TimesNewRomanPS-ItalicMT
     TimesNewRomanPS-BoldMT
     TimesNewRomanPS-BoldItalicMT
 Font family: Trebuchet MS
     TrebuchetMS
     TrebuchetMS-Italic
     TrebuchetMS-Bold
     Trebuchet-BoldItalic
 Font family: Verdana
     Verdana
     Verdana-Italic
     Verdana-Bold
     Verdana-BoldItalic
 Font family: Zapf Dingbats
     ZapfDingbatsITC
 Font family: Zapfino
     Zapfino
 
 */
 
