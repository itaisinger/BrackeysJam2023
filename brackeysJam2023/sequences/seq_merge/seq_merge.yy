{
  "resourceType": "GMSequence",
  "resourceVersion": "1.4",
  "name": "seq_merge",
  "autoRecord": true,
  "backdropHeight": 1080,
  "backdropImageOpacity": 0.5,
  "backdropImagePath": "",
  "backdropWidth": 1920,
  "backdropXOffset": 0.0,
  "backdropYOffset": 0.0,
  "events": {
    "resourceType": "KeyframeStore<MessageEventKeyframe>",
    "resourceVersion": "1.0",
    "Keyframes": [],
  },
  "eventStubScript": {
    "name": "seq_merge_Events115",
    "path": "scripts/seq_merge_Events115/seq_merge_Events115.yy",
  },
  "eventToFunction": {},
  "length": 700.0,
  "lockOrigin": false,
  "moments": {
    "resourceType": "KeyframeStore<MomentsEventKeyframe>",
    "resourceVersion": "1.0",
    "Keyframes": [
      {"resourceType":"Keyframe<MomentsEventKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"MomentsEventKeyframe","resourceVersion":"1.0","Events":[
              "seq_merge_change_sprite",
            ],},},"Disabled":false,"id":"372148d1-e82c-4979-842f-5d7369c4f4e3","IsCreationKey":false,"Key":296.0,"Length":1.0,"Stretch":false,},
      {"resourceType":"Keyframe<MomentsEventKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"MomentsEventKeyframe","resourceVersion":"1.0","Events":[
              "merge_seq_done",
            ],},},"Disabled":false,"id":"2937b150-1641-4f99-a89c-577261699516","IsCreationKey":false,"Key":696.0,"Length":1.0,"Stretch":false,},
    ],
  },
  "parent": {
    "name": "Sequences",
    "path": "folders/Sequences.yy",
  },
  "playback": 0,
  "playbackSpeed": 110.0,
  "playbackSpeedType": 0,
  "showBackdrop": true,
  "showBackdropImage": false,
  "spriteId": null,
  "timeUnits": 1,
  "tracks": [
    {"resourceType":"GMAudioTrack","resourceVersion":"1.1","name":"sfx_cheer","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<AudioKeyframe>","resourceVersion":"1.0","Keyframes":[
          {"resourceType":"Keyframe<AudioKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"AudioKeyframe","resourceVersion":"1.0","Id":{"name":"sfx_cheer","path":"sounds/sfx_cheer/sfx_cheer.yy",},"Mode":0,},},"Disabled":false,"id":"ad04cb19-916d-4fd9-a3d4-255d4d50e3c7","IsCreationKey":false,"Key":264.0,"Length":561.9229,"Stretch":false,},
        ],},"modifiers":[],"trackColour":4294068330,"tracks":[
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"gain","builtinName":5,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,},},"Disabled":false,"id":"f60fbf71-9e48-4aa9-b979-d953267f5f2e","IsCreationKey":false,"Key":622.0,"Length":1.0,"Stretch":false,},
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,},},"Disabled":false,"id":"1616c258-1ff8-4683-992b-c1b32c738c46","IsCreationKey":false,"Key":694.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4294068330,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"position","builtinName":14,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1579.4377,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":-210.80768,},},"Disabled":false,"id":"f1c13c93-35f6-4768-9039-4329f235fdd0","IsCreationKey":false,"Key":631.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4294068330,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"rotation","builtinName":8,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"fdf3a631-480c-4f6d-bc31-26647fa9d569","IsCreationKey":true,"Key":264.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4294068330,"tracks":[],"traits":0,},
      ],"traits":0,},
    {"resourceType":"GMAudioTrack","resourceVersion":"1.1","name":"sfx_boom","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<AudioKeyframe>","resourceVersion":"1.0","Keyframes":[
          {"resourceType":"Keyframe<AudioKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"AudioKeyframe","resourceVersion":"1.0","Id":{"name":"sfx_boom","path":"sounds/sfx_boom/sfx_boom.yy",},"Mode":0,},},"Disabled":false,"id":"a8040861-8a55-428c-86b9-e62e4a05ec27","IsCreationKey":false,"Key":263.0,"Length":168.50955,"Stretch":false,},
        ],},"modifiers":[],"trackColour":4282948594,"tracks":[
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"position","builtinName":14,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":732.1615,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":-208.49988,},},"Disabled":false,"id":"3d5cea09-2302-40a4-98af-5cffbb5edac3","IsCreationKey":false,"Key":349.99982,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4282948594,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"rotation","builtinName":8,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"8f6b801c-a8d1-43bb-a973-c4c638a1d47f","IsCreationKey":true,"Key":263.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4282948594,"tracks":[],"traits":0,},
      ],"traits":0,},
    {"resourceType":"GMGraphicTrack","resourceVersion":"1.0","name":"spr_explosion","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<AssetSpriteKeyframe>","resourceVersion":"1.0","Keyframes":[
          {"resourceType":"Keyframe<AssetSpriteKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"AssetSpriteKeyframe","resourceVersion":"1.0","Id":{"name":"spr_explosion","path":"sprites/spr_explosion/spr_explosion.yy",},},},"Disabled":false,"id":"4fe4afdc-9d97-40fc-911d-2d06e97c2f53","IsCreationKey":false,"Key":263.0,"Length":160.0,"Stretch":false,},
        ],},"modifiers":[],"trackColour":4291686984,"tracks":[
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"origin","builtinName":16,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"f601f44c-9389-41dd-81b6-749be8eff675","IsCreationKey":true,"Key":263.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4291686984,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"position","builtinName":14,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"9eeebce4-2b6e-4541-bcdb-e354f212e601","IsCreationKey":true,"Key":274.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4291686984,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"rotation","builtinName":8,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"13b862e6-5d51-47f6-9705-ba641975b5e7","IsCreationKey":true,"Key":263.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4291686984,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"scale","builtinName":15,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":3.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":3.0,},},"Disabled":false,"id":"ef055b16-98d1-42c8-a215-268b7682ca75","IsCreationKey":false,"Key":349.99982,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4291686984,"tracks":[],"traits":0,},
      ],"traits":0,},
    {"resourceType":"GMInstanceTrack","resourceVersion":"1.0","name":"obj_merge_cutscene_e","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<AssetInstanceKeyframe>","resourceVersion":"1.0","Keyframes":[
          {"resourceType":"Keyframe<AssetInstanceKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"AssetInstanceKeyframe","resourceVersion":"1.0","Id":{"name":"obj_merge_cutscene_e","path":"objects/obj_merge_cutscene_e/obj_merge_cutscene_e.yy",},},},"Disabled":false,"id":"3caba911-8b0b-4501-9d14-fc880a8e6d39","IsCreationKey":false,"Key":0.0,"Length":281.0,"Stretch":false,},
        ],},"modifiers":[],"trackColour":4293216498,"tracks":[
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"origin","builtinName":16,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"ad594ac1-e5b4-4f88-838b-804acb3bb5f4","IsCreationKey":true,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4293216498,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"position","builtinName":14,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":{"resourceType":"GMAnimCurve","resourceVersion":"1.2","name":"Position","channels":[
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"x","colour":4290799884,"points":[
                            {"th0":0.0,"th1":0.0007117438,"tv0":0.0,"tv1":0.0,"x":0.0,"y":30.85,},
                            {"th0":-0.0007117438,"th1":0.008278231,"tv0":0.0,"tv1":0.0,"x":0.0035587188,"y":300.85,},
                            {"th0":-0.0088036135,"th1":0.019099735,"tv0":0.0,"tv1":0.0,"x":0.28803524,"y":600.724,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.6969852,"y":566.1247,},
                            {"th0":-0.10150826,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":0.0,},
                          ],"visible":true,},
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"y","colour":4281083598,"points":[
                            {"th0":0.0,"th1":0.0007117438,"tv0":0.0,"tv1":0.0,"x":0.0,"y":0.0,},
                            {"th0":-0.0007117438,"th1":0.017081851,"tv0":0.0,"tv1":0.0,"x":0.0035587188,"y":0.0,},
                            {"th0":-0.017081851,"th1":0.1822064,"tv0":0.0,"tv1":0.0,"x":0.08896797,"y":0.0,},
                            {"th0":-0.1822064,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":0.0,},
                          ],"visible":true,},
                      ],"function":1,},"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":{"resourceType":"GMAnimCurve","resourceVersion":"1.2","name":"Position","channels":[
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"x","colour":4290799884,"points":[
                            {"th0":0.0,"th1":0.0007117438,"tv0":0.0,"tv1":0.0,"x":0.0,"y":30.85,},
                            {"th0":-0.0007117438,"th1":0.008278231,"tv0":0.0,"tv1":0.0,"x":0.0035587188,"y":300.85,},
                            {"th0":-0.0088036135,"th1":0.019099735,"tv0":0.0,"tv1":0.0,"x":0.28803524,"y":600.724,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.6969852,"y":566.1247,},
                            {"th0":-0.10150826,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":0.0,},
                          ],"visible":true,},
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"y","colour":4281083598,"points":[
                            {"th0":0.0,"th1":0.0007117438,"tv0":0.0,"tv1":0.0,"x":0.0,"y":0.0,},
                            {"th0":-0.0007117438,"th1":0.017081851,"tv0":0.0,"tv1":0.0,"x":0.0035587188,"y":0.0,},
                            {"th0":-0.017081851,"th1":0.1822064,"tv0":0.0,"tv1":0.0,"x":0.08896797,"y":0.0,},
                            {"th0":-0.1822064,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":0.0,},
                          ],"visible":true,},
                      ],"function":1,},"RealValue":0.0,},},"Disabled":false,"id":"7df45351-4af8-4db3-935c-9611795a681d","IsCreationKey":false,"Key":0.0,"Length":281.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4293216498,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"rotation","builtinName":8,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"84bae436-66cb-44a4-9944-e2fbf725e6e0","IsCreationKey":true,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4293216498,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"scale","builtinName":15,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":-1.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,},},"Disabled":false,"id":"1da14ff0-1123-4bcb-bdb0-e46d05f5ed5d","IsCreationKey":false,"Key":12.0,"Length":64.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4293216498,"tracks":[],"traits":0,},
      ],"traits":0,},
    {"resourceType":"GMInstanceTrack","resourceVersion":"1.0","name":"obj_merge_cutscene_p","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<AssetInstanceKeyframe>","resourceVersion":"1.0","Keyframes":[
          {"resourceType":"Keyframe<AssetInstanceKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"AssetInstanceKeyframe","resourceVersion":"1.0","Id":{"name":"obj_merge_cutscene_p","path":"objects/obj_merge_cutscene_p/obj_merge_cutscene_p.yy",},},},"Disabled":false,"id":"c131f2fe-13c2-4c1b-b0e3-5dd8ddb0d779","IsCreationKey":false,"Key":0.0,"Length":700.0,"Stretch":false,},
        ],},"modifiers":[],"trackColour":4282970804,"tracks":[
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"origin","builtinName":16,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"1a60a67c-da2b-42ea-bfdf-eca5bb18132b","IsCreationKey":true,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4282970804,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"position","builtinName":14,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":{"resourceType":"GMAnimCurve","resourceVersion":"1.2","name":"","channels":[
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"x","colour":4290799884,"points":[
                            {"th0":0.0,"th1":0.0007117438,"tv0":0.0,"tv1":0.0,"x":0.0,"y":-30.85,},
                            {"th0":-0.0007117438,"th1":0.008278231,"tv0":0.0,"tv1":0.0,"x":0.0035587188,"y":-300.85,},
                            {"th0":-0.0088036135,"th1":0.019099735,"tv0":0.0,"tv1":0.0,"x":0.28803524,"y":-600.724,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.6969852,"y":-566.125,},
                            {"th0":-0.10150826,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":0.0,},
                          ],"visible":true,},
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"y","colour":4281083598,"points":[
                            {"th0":0.0,"th1":0.0007117438,"tv0":0.0,"tv1":0.0,"x":0.0,"y":0.0,},
                            {"th0":-0.0007117438,"th1":0.017081851,"tv0":0.0,"tv1":0.0,"x":0.0035587188,"y":0.0,},
                            {"th0":-0.017081851,"th1":0.1822064,"tv0":0.0,"tv1":0.0,"x":0.08896797,"y":0.0,},
                            {"th0":-0.1822064,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":0.0,},
                          ],"visible":true,},
                      ],"function":1,},"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":{"resourceType":"GMAnimCurve","resourceVersion":"1.2","name":"","channels":[
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"x","colour":4290799884,"points":[
                            {"th0":0.0,"th1":0.0007117438,"tv0":0.0,"tv1":0.0,"x":0.0,"y":30.85,},
                            {"th0":-0.0007117438,"th1":0.008278231,"tv0":0.0,"tv1":0.0,"x":0.0035587188,"y":300.85,},
                            {"th0":-0.0088036135,"th1":0.019099735,"tv0":0.0,"tv1":0.0,"x":0.28803524,"y":600.724,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.6969852,"y":566.1247,},
                            {"th0":-0.10150826,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":0.0,},
                          ],"visible":true,},
                        {"resourceType":"GMAnimCurveChannel","resourceVersion":"1.0","name":"y","colour":4281083598,"points":[
                            {"th0":0.0,"th1":0.0007117438,"tv0":0.0,"tv1":0.0,"x":0.0,"y":0.0,},
                            {"th0":-0.0007117438,"th1":0.017081851,"tv0":0.0,"tv1":0.0,"x":0.0035587188,"y":0.0,},
                            {"th0":-0.017081851,"th1":0.1822064,"tv0":0.0,"tv1":0.0,"x":0.08896797,"y":0.0,},
                            {"th0":-0.1822064,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":0.0,},
                          ],"visible":true,},
                      ],"function":1,},"RealValue":0.0,},},"Disabled":false,"id":"f7cd8d02-e5a3-4648-8905-0d5b088236d9","IsCreationKey":false,"Key":0.0,"Length":281.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4282970804,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"rotation","builtinName":8,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"3c3853be-13b1-4a46-88bf-50b77e30a674","IsCreationKey":true,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4282970804,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"scale","builtinName":15,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,},},"Disabled":false,"id":"78cde8b2-3c82-4645-9547-2470d013872b","IsCreationKey":true,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4282970804,"tracks":[],"traits":0,},
      ],"traits":0,},
  ],
  "visibleRange": {
    "x": 0.0,
    "y": 699.9999,
  },
  "volume": 1.0,
  "xorigin": 0,
  "yorigin": 0,
}