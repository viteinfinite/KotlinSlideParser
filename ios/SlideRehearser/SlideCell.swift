import UIKit
import KotlinSlideParser

class SlideCell: UICollectionViewCell {
    @IBOutlet private weak var label: UILabel!

    func configure(with page: KSPSlideEntityPage) {
        guard let contents = page.contents as? [KSPMarkdownEntity] else {
            label.attributedText = NSAttributedString()
            return
        }
        label.attributedText = render(contents)
    }
}

enum Styles {
    static func bold(base: [NSAttributedStringKey : AnyObject]? = nil) -> [NSAttributedStringKey : AnyObject] {
        var style = base ?? [NSAttributedStringKey : AnyObject]()
        let size = (style[.font] as? UIFont)?.pointSize ?? 18
        style[.font] = UIFont.boldSystemFont(ofSize: size)
        return style
    }

    static func italic(base: [NSAttributedStringKey : AnyObject]? = nil) -> [NSAttributedStringKey : AnyObject] {
        var style = base ?? [NSAttributedStringKey : AnyObject]()
        let size = (style[.font] as? UIFont)?.pointSize ?? 18
        style[.font] = UIFont.italicSystemFont(ofSize: size)
        return style
    }

    static func inlineCode(base: [NSAttributedStringKey : AnyObject]? = nil) -> [NSAttributedStringKey : AnyObject] {
        var style = base ?? [NSAttributedStringKey : AnyObject]()
        style[.font] = UIFont.systemFont(ofSize: 17)
        style[.backgroundColor] = UIColor.gray
        return style
    }

    static func links(base: [NSAttributedStringKey : AnyObject]? = nil) -> [NSAttributedStringKey : AnyObject] {
        var style = base ?? [NSAttributedStringKey : AnyObject]()
        style[.font] = UIFont.systemFont(ofSize: 17)
        style[.foregroundColor] = UIColor.blue
        style[.underlineStyle] = NSUnderlineStyle.styleSingle as AnyObject
        return style
    }

    static func plainText(base: [NSAttributedStringKey : AnyObject]? = nil) -> [NSAttributedStringKey : AnyObject] {
        var style = base ?? [NSAttributedStringKey : AnyObject]()
        style[.font] = UIFont.systemFont(ofSize: 17)
        return style
    }

    static func refer(base: [NSAttributedStringKey : AnyObject]? = nil) -> [NSAttributedStringKey : AnyObject] {
        var style = base ?? [NSAttributedStringKey : AnyObject]()
        style[.font] = UIFont.systemFont(ofSize: 17)
        style[.backgroundColor] = UIColor.gray
        return style
    }

    static func codeBlock(base: [NSAttributedStringKey : AnyObject]? = nil) -> [NSAttributedStringKey : AnyObject] {
        var style = base ?? [NSAttributedStringKey : AnyObject]()
        style[.font] = UIFont.systemFont(ofSize: 17)
        style[.foregroundColor] = UIColor.white
        style[.backgroundColor] = UIColor.gray
        return style
    }

    static func strikethrough(base: [NSAttributedStringKey : AnyObject]? = nil) -> [NSAttributedStringKey : AnyObject] {
        var style = base ?? [NSAttributedStringKey : AnyObject]()
        style[.font] = UIFont.systemFont(ofSize: 17)
        return style
    }

    static func header(base: [NSAttributedStringKey : AnyObject]? = nil, level: Int) -> [NSAttributedStringKey : AnyObject] {
        var style = base ?? [NSAttributedStringKey : AnyObject]()
        style[.font] = UIFont.boldSystemFont(ofSize: CGFloat(28 + (6 - 2 * level)))
        return style
    }
}

extension SlideCell {
    func render(_ entities: [KSPMarkdownEntity], style: [NSAttributedStringKey : AnyObject]? = nil) -> NSAttributedString {
        let attributedString : NSMutableAttributedString = NSMutableAttributedString()

        for entity in entities {
            switch entity {
            case let bold as KSPMarkdownEntityBold:
                let style = Styles.bold(base: style)
                let subAttrString = render(bold.contents as! [KSPMarkdownEntity], style: style)
                attributedString.append(subAttrString)

            case let italic as KSPMarkdownEntityItalic:
                let style = Styles.italic(base: style)
                let subAttrString = render(italic.contents as! [KSPMarkdownEntity], style: style)
                attributedString.append(subAttrString)

            case let header as KSPMarkdownEntityHeader:
                let style = Styles.header(base: style, level: Int(header.level))
                let subAttrString = render(header.contents as! [KSPMarkdownEntity], style: style)
                attributedString.append(subAttrString)

            case let inline as KSPMarkdownEntityInlineCode:
                let style = Styles.inlineCode(base: style)
                let subAttrString = render(inline.contents as! [KSPMarkdownEntity], style: style)
                attributedString.append(subAttrString)

            case let links as KSPMarkdownEntityLinks:
                let style = Styles.inlineCode(base: style)
                let subAttrString = render(links.contents as! [KSPMarkdownEntity], style: style)
                attributedString.append(subAttrString)

            case let plain as KSPMarkdownEntityPlain:
                attributedString.append(NSAttributedString(string: plain.contents, attributes: style))
                //
                //            case .Refer(let mds):
                //                attributedString.appendAttributedString(NSAttributedString(string: "\n\n"))
                //
                //                var tAttr:[String:AnyObject] = baseAttribute
                //                tAttr[NSBackgroundColorAttributeName] = referTextStyle.backgroundColor
                //
                //                let paras = NSMutableParagraphStyle()
                //                paras.paragraphSpacing = 10
                //                let subAttrString = renderHelper(mds, parentAttribute: tAttr)
                //                attributedString.appendAttributedString(subAttrString)
                //
                //            case .CodeBlock(let code):
                //                attributedString.appendAttributedString(NSAttributedString(string: "\n"))
                //                let backgroundColor = codeBlockStyle.backgroundColor
                //                let foregroundColor = codeBlockStyle.foregroundColor
                //                let paras = NSMutableParagraphStyle()
                //                paras.paragraphSpacing = 0
                //                attributedString.appendAttributedString(NSAttributedString(string: code, attributes: [NSBackgroundColorAttributeName:backgroundColor!, NSForegroundColorAttributeName:foregroundColor!,NSParagraphStyleAttributeName:paras]))
                //
                //            case .Delete(let mds):
                //                var tAttr: [NSAttributedStringKey : AnyObject] = baseAttribute
                //                if tAttr[NSFontAttributeName] == nil{
                //                    tAttr[NSFontAttributeName] = deleteStyle.fontName
                //                }
                //                tAttr[NSStrikethroughStyleAttributeName] = NSUnderlineStyle.StyleDouble.rawValue
                //                let subAttrString = renderHelper(mds, parentAttribute: tAttr)
                //                attributedString.appendAttributedString(subAttrString)
            //            }
            default:
                break
            }
        }
        return attributedString
    }
}
