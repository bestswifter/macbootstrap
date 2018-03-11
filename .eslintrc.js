module.exports = {

    "parserOptions": {
        "ecmaVersion": 6,
        "sourceType": "module",
        "ecmaFeatures": {
            "jsx": true,
            "experimentalObjectRestSpread": true
        }
    },
    "env": {
        "browser": true,
        "node": true,
        "commonjs": true,
        "amd": true,
        "jquery": true,
        "mocha": true,
        "es6": true
    },
    // 开启默认规则：http://eslint.cn/docs/rules/
    "extends": "eslint:recommended",
    "rules": {
        // 【error】统一打括号书写规则：
        //
        // http://eslint.cn/docs/rules/curly
        //
        // 示范：
        // if (foo) {
        //     foo++;
        // }
        //
        // while (bar) {
        //     baz();
        // }
        //
        // if (foo) {
        //     baz();
        // } else {
        //     qux();
        // }
        //
        // 错误：
        // if (foo) foo++;
        //
        // while (bar)
        //     baz();
        //
        // if (foo) {
        //     baz();
        // } else qux();
        "curly": ["error", "all"],

        // 【error】要求使用 === 和 !==
        //
        // http://eslint.cn/docs/rules/eqeqeq
        //
        // 示范：
        // a === b
        // foo === true
        // bananas !== 1
        //
        // 错误：
        // a == b
        // foo == true
        // bananas != 1
        "eqeqeq": ["error", "always"],

        // 【off 关闭】可以在正则表达式中使用控制字符
        // http://eslint.cn/docs/rules/no-control-regex
        //
        // 允许：
        // var pattern1 = /\x1f/;
        // var pattern2 = new RegExp("\x1f");
        "no-control-regex": "off",

        // 【error】禁止出现没有任何注释的空函数
        //
        // http://eslint.cn/docs/rules/no-empty-function
        //
        // 示范：
        // function foo() {
        //     // do nothing.
        // }
        //
        // var foo = function() {
        //     // any clear comments.
        // };
        //
        // 错误：
        // function foo() {}
        // var foo = function() {};
        // var foo = () => {};
        "no-empty-function": "warn",

        // 【error】禁用 eval()
        // http://eslint.cn/docs/rules/no-eval
        "no-eval": "error",

        // 【error】✨浮点小数书写规范化：
        //
        // http://eslint.cn/docs/rules/no-floating-decimal
        //
        // 示范：
        // var num = 0.5;
        // var num = 2.0;
        // var num = -0.7;
        //
        // 错误：
        // var num = .5;
        // var num = 2.;
        // var num = -.7;
        "no-floating-decimal": "error",

        // disallow assignments to native objects or read-only global variables
        // 【error】 不允许重写 native objects 和只读全局变量
        //
        // http://eslint.cn/docs/rules/no-global-assign
        //
        // 错误：
        // Object = null
        // undefined = 1
        "no-global-assign": "error",

        // 【error】禁用不必要的嵌套块
        //
        // 参看下面👇链接：
        // http://eslint.cn/docs/rules/no-lone-blocks
        //
        // 错误：
        // {}
        //
        // if (foo) {
        //     bar();
        //     {
        //         baz();
        //     }
        // }
        "no-lone-blocks": "error",

        // 【error】禁止循环中存在函数
        //
        // 参看下面👇链接：
        // http://eslint.cn/docs/rules/no-loop-func
        "no-loop-func": "error",

        // 【error】禁止出现多个空格【除去配置的例外】
        //
        // http://eslint.cn/docs/rules/no-multi-spaces
        //
        // 示范：
        // var a = 1;
        // if(foo === "bar") {}
        // a << b
        // var someVar      = 'foo';
        // var someOtherVar = 'barBaz';
        // import mod          from 'mod';
        // import someOtherMod from 'some-other-mod';
        //
        // 错误：
        // var a =  1;
        // if(foo   === "bar") {}
        "no-multi-spaces": ["error", {
            "exceptions": {
                // 拯救强迫症😢
                "VariableDeclarator": true, // 赋值语句允许
                "ImportDeclaration": true // import 语句允许
            }
        }],

        // 【error】禁止在返回语句中赋值
        //
        // http://eslint.cn/docs/rules/no-return-assign
        //
        // ❌错误：
        // function doSomething() {
        //     return foo = bar + 2;
        // }
        // function doSomething() {
        //     return (foo = bar + 2);
        // }
        "no-return-assign": ["error", "always"],

        // 【warn】禁止没有必要的字符拼接
        //
        // http://eslint.cn/docs/rules/no-useless-concat
        //
        // 示范：
        // // when a non string is included
        // var c = a + b;
        // var c = '1' + a;
        // var a = 1 + '1';
        // var c = 1 - 2;
        // // when the string concatenation is multiline
        // var c = "foo" +
        //     "bar";
        //
        // 错误：
        // var a = `some` + `string`;
        // var a = '1' + '0';
        "no-useless-concat": "warn",

        // 【warn】禁用不必要的转义
        //
        // http://eslint.cn/docs/rules/no-useless-escape
        //
        // 示范：
        // "\"";
        // '\'';
        // "\x12";
        // "\u00a9";
        //
        // 错误：
        // "\'";
        // '\"';
        // "\#";
        // "\e";
        // `\"`;
        "no-useless-escape": "warn",

        // 【error】禁用 with 语句
        //
        // http://eslint.cn/docs/rules/no-with
        "no-with": "error",

        // 【warn】禁止未使用过的变量
        //
        // "vars": "all" 检测所有变量，包括全局环境中的变量。这是默认值。
        // "args": "none" 不检查函数参数。
        // http://eslint.cn/docs/rules/no-unused-vars
        "no-unused-vars": ["warn", { "vars": "all", "args": "none" }],

        // 【warn】禁止定义前使用
        //
        // "functions": true 这个参数表示该规则是否要检测函数的声明。 如果参数是 true，该
        // 规则会在引用一个未提前声明的函数时发出警报。
        // "classes": true 这个参数表示是否要检测作用域中顶部的类声明。 如果参数是 true，该
        // 规则会在引用一个未提前声明的类时发出警报。
        // http://eslint.cn/docs/rules/no-use-before-define
        //
        // 示范：
        // var a;
        // a = 10;
        // alert(a);
        //
        // var f = function (){} // 必须
        // function f() {}
        // f(1);
        "no-use-before-define": ["warn", { "functions": true, "classes": true }],

        // 【error】✨数组中括号内禁止使用空格：
        //
        // "never" (默认) 禁止在数组括号内出现空格
        // http://eslint.cn/docs/rules/array-bracket-spacing
        //
        // 示范：
        // var arr = ['foo', 'bar', 'baz'];
        // var arr = [['foo'], 'bar', 'baz'];
        // var arr = [
        //   'foo',
        //   'bar',
        //   'baz'
        // ];
        //
        // 错误：
        // var arr = [ 'foo', 'bar' ];
        // var arr = ['foo', 'bar' ];
        // var arr = [ ['foo'], 'bar'];
        "array-bracket-spacing": ["error", "never"],

        // 【error】强制在单行代码块中使用空格：
        //
        // "always" (more) 要求使用一个或多个空格
        // http://eslint.cn/docs/rules/block-spacing
        //
        // 示范：
        // function foo() { return true; }
        // if (foo) { bar = 0; }
        //
        // 错误：
        // function foo() {return true;}
        // if (foo) { bar = 0;}
        "block-spacing": "error",

        // 【warn】大括号风格：
        //
        // "1tbs" (默认) 强制 one true brace style
        // "allowSingleLine": true (默认 false) 允许块的开括号和闭括号在同一行
        // http://eslint.cn/docs/rules/brace-style
        //
        // 示范：
        // if (foo) {
        //     bar();
        // } else {
        //     baz();
        // }
        //
        // try {
        //     somethingRisky();
        // } catch(e) {
        //     handleError();
        // }
        //
        // // 允许没有大括号
        // if (foo) bar();
        // else if (baz) boom();
        //
        // // 允许单行
        // if (foo) { bar(); } else { baz(); }
        //
        // 错误：
        // if (foo) {
        //     bar();
        // }
        // else {
        //     baz();
        // }
        "brace-style": ["warn", "1tbs", { "allowSingleLine": true }],

        // 【error】✨对于多行情况下,必须要有拖尾逗号 ：
        //
        // "always-multiline" 多行模式必须带逗号，单行模式不能带逗号
        // http://eslint.cn/docs/rules/comma-dangle
        //
        // 示范：
        // var foo = {
        //     bar: "baz",
        //     qux: "quux",
        // };
        //
        // 错误：
        // var foo = {
        //     bar: "baz",
        //     qux: "quux"
        // };
        //
        // 示范：
        // var foo = {bar: "baz", qux: "quux"};
        //
        // 错误：
        // var foo = {bar: "baz", qux: "quux",};
        "comma-dangle": ["error", "always-multiline"],

        // 【error】强制在逗号周围使用空格规范：
        //
        // "before": false (默认) 禁止在逗号前使用空格
        // "after": true (默认) 要求在逗号后使用一个或多个空格
        // http://eslint.cn/docs/rules/comma-spacing
        //
        // 示范：
        // var arr = [1, 2];
        // var arr = [1,, 3]
        // var obj = {"foo": "bar", "baz": "qur"};
        // foo(a, b);
        // new Foo(a, b);
        // function foo(a, b){}
        // a, b
        //
        // 错误：
        // var arr = [1,2];
        "comma-spacing": ["error", { "before": false, "after": true }],

        // 【error】逗号风格规范化：
        //
        // "last" (默认) 要求逗号放在数组元素、对象属性或变量声明之后，且在同一行
        // http://eslint.cn/docs/rules/comma-style
        //
        // 示范：
        // var foo = 1, bar = 2;
        //
        // var foo = 1,
        //     bar = 2;
        "comma-style": ["error", "last"],

        // 【error】禁止在计算属性中使用空格：
        //
        // "never" (默认) 禁止在计算属性内使用空格
        // http://eslint.cn/docs/rules/computed-property-spacing
        //
        // 示范：
        // obj[foo]
        // obj['foo']
        // var x = {[b]: a}
        // obj[foo[bar]]
        //
        // 错误：
        // obj[foo ]
        // obj[ 'foo']
        // var x = {[ b ]: a}
        // obj[foo[ bar ]]
        "computed-property-spacing": ["error", "never"],

        // 【error】函数名称和调用括号之间不应有有空格：
        //
        // http://eslint.cn/docs/rules/func-call-spacing
        //
        // 示范：
        // fn();
        //
        // 错误：
        // fn ();
        "func-call-spacing": ["error", "never"],

        // 【warn】强制使用一致的缩进，默认是 4 个空格：
        //
        // "SwitchCase" switch case 语句需要缩进
        // 多行变量声明需要缩进
        // http://eslint.cn/docs/rules/indent
        //
        // 示范：
        // switch(a){
        //     case "a":
        //         break;
        //     case "b":
        //         break;
        // }
        // var a,
        //     b,
        //     c;
        "indent": ["warn", 4, { "SwitchCase": 1, "VariableDeclarator": 1 }],

        // 【error】强制在对象字面量的键和值之间使用一致的空格：
        //
        // "beforeColon": false (默认) 禁止在对象字面量的键和值之间存在空格
        // "afterColon": true (默认) 要求在对象字面量的冒号和值之间存在至少有一个空格
        // "mode": strict (默认) 要求在冒号前后只有一个空格
        // http://eslint.cn/docs/rules/key-spacing
        //
        // 示范：
        // var obj = { foo: 42 };
        // // "mode": strict
        // call({
        //     foobar: 42,
        //     bat: 2 * 2
        // });
        //
        // 错误：
        // var obj = { foo : 42 };
        // // "mode" : strict
        // call({
        //     foobar  : 42,
        //     bat:2 * 2
        // });
        "key-spacing": ["error", {
            "beforeColon": false,
            "afterColon": true,
            "mode": "strict"
        }],

        // 【error】关键字周围空格的一致性：
        // 该规则强制关键字和类似关键字的符号周围空格的一致性：as、async、await、break、case、
        // catch、class、const、continue、debugger、default、delete、do、else、export、
        // extends、finally、for、from、function、get、if、import、in、instanceof、let、
        // new、of、return、set、static、super、switch、this、throw、try、typeof、var、
        // void、while、with 和 yield。
        //
        // before": true (默认) 要求在关键字之前至少有一个空格
        // "after": true (默认) 要求在关键字之后至少有一个空格
        // http://eslint.cn/docs/rules/keyword-spacing
        //
        // 示范较多，参看上述链接⬆️
        "keyword-spacing": ["error", { "before": true, "after": true }],

        // 【error】使用一致的换行符风格：
        //
        // "unix" (默认) 强制使用 Unix 换行符： \n。
        // http://eslint.cn/docs/rules/linebreak-style
        //
        // 示范：
        // var a = 'a', // \n
        //     b = 'b'; // \n
        // // \n
        // function foo(params) { // \n
        //     // do stuff \n
        // }// \n
        "linebreak-style": ["error", "unix"],

        // 【warn】注释周围空行规则：
        //
        // "beforeBlockComment": true (默认) 要求在块级注释之前有一空行
        // http://eslint.cn/docs/rules/lines-around-comment
        //
        // 示范：
        // var night = "long";
        //
        // /* what a great and wonderful day */
        // var day = "great"
        "lines-around-comment": ["warn", { "beforeBlockComment": true }],

        // 【error】语句的最大可嵌套深度为4：
        //
        // http://eslint.cn/docs/rules/max-depth
        //
        // 示范：
        // function foo() {
        //     for (;;) { // Nested 1 deep
        //         let val = () => (param) => { // Nested 2 deep
        //            if (true) { // Nested 3 deep
        //                 if (true) { // Nested 4 deep
        //                 }
        //             }
        //         };
        //     }
        // }
        "max-depth": ["warn", 4],

        // 【warn】最大行宽100：
        //
        // http://eslint.cn/docs/rules/max-len
        "max-len": ["warn", {
            "code": 200 // 强制行的最大长度
        }],

        // 【warn】不允许多个空行：
        //
        // "max" (默认为 2) 强制最大连续空行数。
        // "maxEOF" 强制文件末尾的最大连续空行数。
        // "maxBOF" 强制文件开始的最大连续空行数。
        // http://eslint.cn/docs/rules/no-multiple-empty-lines
        "no-multiple-empty-lines": ["warn",
            { "max": 2, "maxEOF": 1, "maxBOF": 1 }],

        // 【error】不允许缩进符号出现：
        //
        // http://eslint.cn/docs/rules/no-tabs
        "no-tabs": "error",

        // 【warn】禁止行尾空白：
        //
        // http://eslint.cn/docs/rules/no-trailing-spaces
        //
        // 示范：
        // var foo = 0;
        // var baz = 5;
        //
        // 错误：
        // var foo = 0;   ❌
        "no-trailing-spaces": "warn",

        // 【error】属性前面不能有空格：
        //
        // 该规则禁止在点号周围或对象属性之前的左括号前出现空白。如果对象和属性不在同一行上，
        // 这种情况，该规则允许使用空白，因为对级联的属性增加新行是一种很普遍的行为。
        // http://eslint.cn/docs/rules/no-whitespace-before-property
        //
        // 示范：
        // foo.bar
        // foo[bar]
        // foo[ bar ]
        // foo.bar.baz
        // foo
        //   .bar().baz()
        //
        // 错误：
        // foo. bar()
        "no-whitespace-before-property": "error",

        // 【error】强制换行符放在操作符前面：
        //
        // "before" 要求把换行符放在操作符前面
        // http://eslint.cn/docs/rules/operator-linebreak
        //
        // 示范：
        // if (someCondition
        //     || otherCondition) {
        // }
        //
        // answer = everything
        //   ? 42
        //   : foo;
        //
        // var fullHeight = borderTop
        //     + innerHeight
        //     + borderBottom;
        //
        // 错误：
        // var fullHeight = borderTop +
        //     innerHeight +
        //     borderBottom;
        "operator-linebreak": ["error", "before", {
            // "overrides": { "?": "ignore", ":": "ignore" }
        }],

        // 【error】对象字面量属性名称尽量不用引号：
        //
        // "as-needed" 当没有严格要求时，禁止对象字面量属性名称使用引号
        // http://eslint.cn/docs/rules/quote-props
        //
        // 示范：
        // var object1 = {
        //     'a-b': 0,
        //     '0x0': 0,
        //     '1e2': 0
        // };
        //
        // var object2 = {
        //     foo: 'bar',
        //     baz: 42,
        //     true: 0,
        //     0: 0,
        //     'qux-lorem': true
        // };
        //
        // 错误：
        // var object2 = {
        //     'foo': 'bar',
        //     baz: 42,
        //     true: 0,
        //     0: 0,
        //     qux-lorem: true
        // };
        "quote-props": ["error", "as-needed"],

        // 【error】尽可能地使用单引号：
        //
        // "single" 要求尽可能地使用单引号
        // http://eslint.cn/docs/rules/quotes
        //
        // 示范：
        // var single = 'single';
        // // backticks are allowed due to substitution⬇️
        // var backtick = `back${x}tick`;
        "quotes": ["error", "single"],

        // 【error】分号前后空格规则：
        //
        // before 为 false，分号之前禁止有空格
        // after 为 true.分号之后强制有空格
        // http://eslint.cn/docs/rules/semi-spacing
        //
        // 示范：
        // var foo;
        // var foo; var bar;
        // throw new Error("error");
        // while (a) { break; }
        // for (i = 0; i < 10; i++) {}
        // for (;;) {}
        // if (true) {;}
        // ;foo();
        "semi-spacing": ["error", { "before": false, "after": true }],

        // 【error】语句末需要分号：
        //
        // "always" (默认) 要求在语句末尾使用分号
        // http://eslint.cn/docs/rules/semi
        //
        // 示范：
        // var name = "ESLint";
        // object.method = function() {
        //     // ...
        // };
        "semi": ["error", "always"],

        // 【error】语句块之前需要空格：
        //
        // "always"，块语句必须总是至少有一个前置空格
        // http://eslint.cn/docs/rules/space-before-blocks
        //
        // 示范：
        // if (a) {
        //     b();
        // }
        //
        // for (;;) {
        //     b();
        // }
        "space-before-blocks": "error",

        // 【warn】函数圆（小）括号左边保留空格，箭头函数忽略：
        //
        // http://eslint.cn/docs/rules/space-before-function-paren
        "space-before-function-paren": ["warn", {
            // 匿名函数示范：
            // var bar = function () {
            //     // ...
            // };
            "anonymous": "always",
            // 命名函数示范：
            // function foo () {
            //     // ...
            // }
            "named": "ignore",
            // 箭头函数示范(均可)：
            // var foo = async () => 1
            // var foo = async() => 1
            "asyncArrow": "ignore"
        }],

        // 【error】圆（小）括号内不需要空格：
        //
        // "never" 强制圆括号内没有空格 (默认)
        // http://eslint.cn/docs/rules/space-in-parens
        //
        // 示范：
        // foo();
        // foo('bar');
        // var foo = (1 + 2) * 3;
        //
        // // 错误：
        // foo( );
        // foo('bar' );
        // var foo = ( 1 + 2) * 3;
        "space-in-parens": ["error", "never"],

        // 【error】中缀操作符需要左右空格：
        //
        // 要求中缀操作符周围有空格
        // http://eslint.cn/docs/rules/space-infix-ops
        //
        // 示范：
        // a + b;
        // a ? b : c;
        // const a = {b: 1};
        "space-infix-ops": "error",

        // 【error】一元操作符：
        //
        // words - 适用于单词类一元操作符，例如：new、delete、typeof、void、yield
        // nonwords - 适用于这些一元操作符: -、+、--、++、!、!!
        // http://eslint.cn/docs/rules/space-unary-ops
        //
        // 示范：
        // delete foo.bar;
        // new Foo;
        // ++foo;
        // foo--;
        // +"3";
        "space-unary-ops": ["error", { "words": true, "nonwords": false }],

        // 【warn】注释风格：
        //
        // "always"，// 或 /* 需要跟随至少一个空白
        // "balanced": true 而且是 "always" 那么 /* 后必须有只上一个空白，*/之前必须至少有一个空白
        // http://eslint.cn/docs/rules/spaced-comment
        //
        // 示范：
        // // 一个行注释
        // /* 一个块注释 */
        //
        // 错误：
        // //一个行注释
        "spaced-comment": ["warn", "always", {
            "line": { // 行注释
                // "markers": ["/"],
                // "exceptions": ["-", "+"]
            },
            "block": { // 块注释，需要对称的空格
                // "markers": ["!"],
                // "exceptions": ["*"],
                "balanced": true
            }
        }],

        "no-console": ["warn"]
    },
    "globals": {
        "Vue": false,
        "Vuex": false,
        "VueAsyncData": false,
        "GLOBAL_VAR": false,
        "Tetris": false,
        "fis": false,
        "_": false,
        "__inline": false,
        "__uri": false,
        "listener": false,
        "module": false,
        "Pagelet": false,
        "UE": false,
        "Swiper": false,
        "ZeroClipboard": false,
        "urlize": false,
        "__M": false,
        "Raven": false,
        "Common": false,
        "ReportSdk": false,
        "Util": false,
        "CONST": false,
        "wx": false,
        "gaevent": false
    }

};
