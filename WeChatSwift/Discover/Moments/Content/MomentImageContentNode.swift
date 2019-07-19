//
//  ImageContentNode.swift
//  WeChatSwift
//
//  Created by xu.shuifeng on 2019/7/17.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import AsyncDisplayKit

extension MomentCellNode {
    
    class ImageContentNode: MomentContentNode {
        
        private let imageNode: ASNetworkImageNode = ASNetworkImageNode()
        
        private var ratio: CGFloat = 1.0
        
        init(image: MomentMedia) {
            super.init()
            
            imageNode.url = image.url
            ratio = image.size.height / image.size.width
            
            imageNode.contentMode = .scaleToFill
            imageNode.clipsToBounds = true
            imageNode.shouldCacheImage = false
            addSubnode(imageNode)
        }
        
        override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
            let width = constrainedSize.max.width * 0.75
            
            let ratiopSpec = ASRatioLayoutSpec(ratio: ratio, child: imageNode)
            ratiopSpec.style.maxSize = CGSize(width: width, height: width)
            
            let layout = ASStackLayoutSpec.horizontal()
            layout.style.flexGrow = 1.0
            layout.children = [ratiopSpec]
            return layout
        }
    }
}