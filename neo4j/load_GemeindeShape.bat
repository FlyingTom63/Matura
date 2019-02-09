CALL run_cypher_shell.bat ^
"

CREATE (:KoordinateTmp {name:'640398.090050001 222101.56', X:toFloat(640398.090050001), Y:toFloat(222101.56)});
CREATE (:KoordinateTmp {name:'640397.699050002 222113.707', X:toFloat(640397.699050002), Y:toFloat(222113.707)});
CREATE (:KoordinateTmp {name:'640397.06005 222133.55', X:toFloat(640397.06005), Y:toFloat(222133.55)});
CREATE (:KoordinateTmp {name:'640400.11005 222148.22', X:toFloat(640400.11005), Y:toFloat(222148.22)});
CREATE (:KoordinateTmp {name:'640394.920049999 222168.05', X:toFloat(640394.920049999), Y:toFloat(222168.05)});
CREATE (:KoordinateTmp {name:'640394.70005 222178.08', X:toFloat(640394.70005), Y:toFloat(222178.08)});
CREATE (:KoordinateTmp {name:'640400.54005 222196.65', X:toFloat(640400.54005), Y:toFloat(222196.65)});
CREATE (:KoordinateTmp {name:'640434.22005 222217.87', X:toFloat(640434.22005), Y:toFloat(222217.87)});
CREATE (:KoordinateTmp {name:'640470.039050002 222235.236', X:toFloat(640470.039050002), Y:toFloat(222235.236)});
CREATE (:KoordinateTmp {name:'640476.070050001 222237.49', X:toFloat(640476.070050001), Y:toFloat(222237.49)});
CREATE (:KoordinateTmp {name:'640493.782049999 222244.056', X:toFloat(640493.782049999), Y:toFloat(222244.056)});
CREATE (:KoordinateTmp {name:'640496.030049998 222245.48', X:toFloat(640496.030049998), Y:toFloat(222245.48)});
CREATE (:KoordinateTmp {name:'640534.136050001 222269.242', X:toFloat(640534.136050001), Y:toFloat(222269.242)});

" ^
1>load_GemeindeShape.log ^
2>load_GemeindeShape.err