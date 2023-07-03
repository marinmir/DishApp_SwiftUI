//
//  DishDetailsCardView.swift
//  DishesApp
//
//  Created by Magina Marina on 02.07.2023.
//

import SwiftUI

struct DishDetailsCardView: View  {
    var dish: Dish
    @Binding var isVisible: Bool
    @EnvironmentObject var cartViewModel: CartViewModel

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Color("grayBackground")
                
                AsyncImage(
                    url: URL(string: dish.imageUrl),
                    content: { image in
                        image
                            .resizable()
                        
                    },
                    placeholder: { ProgressView() })
                .frame(width: 198, height: 204)
                
                VStack {
                    Spacer()
                        .frame(height: 8)
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            print("favorite tapped")
                        }) {
                            Image("heartDishDetails")
                                .frame(width: 24, height: 24)
                        }
                        .frame(width: 40, height: 40)
                        .background(.white)
                        .cornerRadius(8)
                        
                        
                        Spacer()
                            .frame(width: 8)
                        
                        Button(action: {
                            isVisible = false
                        }) {
                            Image("cancelDishDetails")
                                .frame(width: 24, height: 24)
                        }
                        .frame(width: 40, height: 40)
                        .background(.white)
                        .cornerRadius(8)
                        
                        Spacer()
                            .frame(width: 8)
                    }
                    Spacer()
                }
                
            }
            .frame(maxHeight: 232)
            .cornerRadius(10)
            
            Spacer()
                .frame(height: 8)
            
            Text(dish.name)
                .font(.system(size: 16, weight: .medium))
                .frame(alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
                .lineLimit(1)
            
            Spacer()
                .frame(height: 8)
            
            HStack {
                Text("\(dish.price) ₽")
                    .foregroundColor(.black)
                
                Spacer()
                    .frame(width: 0)
                
                Text(" · ")
                    .foregroundColor(.black.opacity(0.4))
                
                Spacer()
                    .frame(width: 0)
                
                Text("\(dish.weight)г")
                    .foregroundColor(.black.opacity(0.4))
                
            }
            .font(.system(size: 14, weight: .regular))
            .frame(alignment: .leading)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
            
            Spacer()
                .frame(height: 8)
            
            Text("\(dish.description)")
                .foregroundColor(.black.opacity(0.65))
                .font(.system(size: 14, weight: .regular))
            
            Spacer()
                .frame(height: 16)
            
            Button(action: {
                cartViewModel.addToCart(dish)
                isVisible = false
            }) {
                Text("Добавить в корзину")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 48)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
            }
            .background(Color("AccentColor"))
            .cornerRadius(10)
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .background(.white)
        .cornerRadius(15)
    }
}

struct DishDetailsCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        DishDetailsCardView(dish: Dish(id: 1, name: "Example dish", price: 340, weight: 200, description: "just some text fddgjngkj  ejrngjerg jhergjnrg jerg iejrgijrneg", imageUrl: "https://lh3.googleusercontent.com/fife/APg5EOZwXlSvVv7qAPzCjMLni5B6UOj2rqnQxbVcUixlPdm0nDPChMh8SmfbyhGOQXXTw9eQlySJ6XO34ix7DimTqUDcnB6MRb_GS6O8z4lD8vyM3h67V5rgFyFgeJ5anUUivDGRJrRCPvsmvSauRFvzv9QwQR3BfMQaECH70N5SW2oiFGS-MJBhuoAR3-kEVBgpAel2P4tfdNcD0PBHe-P9xgsl-fITrk9XWimTNFQA_zManQaDtaPT4w8lVS-jqwWXizGBJ31kCn_nxV6D4K3klF5DCKaK63JnTAx4AiwvMj88Vp2-BhK3WgEwJsW8cDCaapvV1-XFb3SFARRKfrLesXiJCVq6IuEllQzkcU81D-BFYIxLc_tfw9d7NA5QR2s_JnOtd1VK2plQfo_D7JEQDoXCmeMM-6L8C9D2b5YtUoc73cv7KUrYuZCP9jymc21HgPSiTXpmFo7kLhrCLn3ePivaDoGIL7xzaQEKRnXX5tCOeHFlIhq78TeZwIWIVWxSwaWs65RCVo98LuZiOfCcu3u69hKVme5bHVHQNpolqHw6RgXInDcSO-1c-HY4TAyaPhtpLWxE5bd_XwGnso6YEdHg3kFqANZwXEv9hb7DY39CasubzAwYnCsOOq07b0uFF1jRAvgjejxJJcXiE88XIs9QpwwaQCrtGuHbmDIzbGlx17a6-XommGe2cobC4MZ9jqfW6lCOi22tAix7g5J3194RHXyb1cVs5Pt-U0l88Z0WAX_rLyxogDIFVQc0fhm7A7BZOrDSAaH-Ii8ZEOe3IGtz4IbVYRmMUWBKM5FXrcKBpxNenheeBj3ifFYtJHsXdW_eK3JRsHGY4IZPODRF16EqiemMQKHNo3IRI73QsKAIcgsHd6SZJrh9OxDbRNHC6ZXVuIYqzFf_UVzLLmCx-9xWfXVBwN5sMh38u2Yq1jPNv2VQqQgzCrQTtvheMjo28Z00rc6JQ7KFo-3LsG45dXR74B6dprRwYZb1HK9XMzo2hYh2dwU0VSOkO4DIjzoeAhstr37PLpFxUYmuQi8HTxm_SOdov2LQs_ZS2gLk7WqHIQjALu67M6MtifU0aGivw_oV24I8CdBpP_4JsupRFOTrOKlcjPtYYJGCPjXTzsF2gbc3N_g-f45lS1FKltDWY1DNnc2sE4pmlPaeQG52EfLFiw6tdAZfzkuFBbCED4-GMUNIhhnwYl3lO1EL1NMt7W09fC6pdebC5JqCtnKwrhPsQmVaEIc18oOlVsK3ZHJNacu7MzsB9moZgZDb4IXFm71-ad7Vdu3l5eyN-533i1U7ikpbc8v9JpShD9Exd6QHyPWcEaVk-TuAwz4509t1ioDTEp_rSVDhxli2k0IzhODBtb6ChBMmhHP_MO8NdTvU_y5hKpg7cj3YgJ26aizvQi0Qq5koz5fVEFBtaXXw5ok_rwFqagW_LmKGIRqyydVb2BRILFv6D3bp-NC1hBnvYUS4VGXD4YGRVP3eK-dQ4kDVWd1RZ5gllZHgA8OTuzGgxGOGmGaOmkiSJHpx2Xt1XU8r86iHo6EzjyibiQxGsBfNrhtHXf5IxyOwNR5P76lhdTB_TOc9t8MQ0Pc86wZWye8F-9W7tDZ_GsyPWUYzlfWU174gOObTmnKcWY5IfeEJr073IB-l=w1366-h617", tegs: ["все меню"]), isVisible: .constant(true))
    }
}
