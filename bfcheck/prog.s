.section        __TEXT,__text,regular,pure_instructions
.build_version macos, 14, 0     sdk_version 14, 4
.globl  _bf_main
.p2align        2

_bf_main:
	stp x29, x30, [sp, #-32]!
	str x19, [sp, #16]
	mov     x29, sp
	mov x19, x0
targ0:
	add x19, x19, 1
targ1:
	add x19, x19, 1
targ2:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ3:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ5
targ4:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ5:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ3
targ6:
	add x19, x19, 1
targ7:
	add x19, x19, 1
targ8:
	add x19, x19, 1
targ9:
	add x19, x19, 1
targ10:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ11:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ12:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ13:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ14:
	sub x19, x19, 1
targ15:
; ignoring 'T'
targ16:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ17:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ18:
; ignoring 'W'
targ19:
	sub x19, x19, 1
targ20:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ30
targ21:
	add x19, x19, 1
targ22:
	sub x19, x19, 1
targ23:
	sub x19, x19, 1
targ24:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ25:
	add x19, x19, 1
targ26:
	add x19, x19, 1
targ27:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ28:
	sub x19, x19, 1
targ29:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ30:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ20
targ31:
	add x19, x19, 1
targ32:
	add x19, x19, 1
targ33:
	bl _getchar
	strb w0, [x19]
targ34:
	add x19, x19, 1
targ35:
; ignoring 'E'
targ36:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ37:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ38:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ39:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ40:
	sub x19, x19, 1
targ41:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ43
targ42:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ43:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ41
targ44:
; ignoring '9'
targ45:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ46:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ47:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ48:
; ignoring 'A'
targ49:
	add x19, x19, 1
targ50:
	sub x19, x19, 1
targ51:
; ignoring '0'
targ52:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ53:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ54:
	bl _getchar
	strb w0, [x19]
targ55:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ56:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ57:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ58:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ59:
; ignoring 'A'
targ60:
	add x19, x19, 1
targ61:
	add x19, x19, 1
targ62:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ63:
	add x19, x19, 1
targ64:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ65:
	sub x19, x19, 1
targ66:
	sub x19, x19, 1
targ67:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ68:
	bl _getchar
	strb w0, [x19]
targ69:
	sub x19, x19, 1
targ70:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ71:
; ignoring 'k'
targ72:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ73:
	sub x19, x19, 1
targ74:
	sub x19, x19, 1
targ75:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ76:
	sub x19, x19, 1
targ77:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ94
targ78:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ90
targ79:
	sub x19, x19, 1
targ80:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ81:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ82:
	add x19, x19, 1
targ83:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ84:
	sub x19, x19, 1
targ85:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ86:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ87:
	add x19, x19, 1
targ88:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ89:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ90:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ78
targ91:
	add x19, x19, 1
targ92:
; ignoring non-command character
targ93:
	sub x19, x19, 1
targ94:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ77
targ95:
	add x19, x19, 1
targ96:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ97:
; ignoring 'a'
targ98:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ99:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ100:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ101:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ102:
	add x19, x19, 1
targ103:
	sub x19, x19, 1
targ104:
	sub x19, x19, 1
targ105:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ106:
; ignoring 'P'
targ107:
	add x19, x19, 1
targ108:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ109:
	sub x19, x19, 1
targ110:
; ignoring 'x'
targ111:
	add x19, x19, 1
targ112:
; ignoring 'N'
targ113:
	add x19, x19, 1
targ114:
	add x19, x19, 1
targ115:
; ignoring '7'
targ116:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ117:
; ignoring 'B'
targ118:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ119:
; ignoring 't'
targ120:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ121:
; ignoring 'X'
targ122:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ123:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ125
targ124:
	add x19, x19, 1
targ125:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ123
targ126:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ127
targ127:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ126
targ128:
	sub x19, x19, 1
targ129:
	sub x19, x19, 1
targ130:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ131:
	add x19, x19, 1
targ132:
	add x19, x19, 1
targ133:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ134:
	sub x19, x19, 1
targ135:
	add x19, x19, 1
targ136:
	bl _getchar
	strb w0, [x19]
targ137:
	add x19, x19, 1
targ138:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ139:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ140:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ141:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ142:
; ignoring 'S'
targ143:
	sub x19, x19, 1
targ144:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ145:
	add x19, x19, 1
targ146:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ147:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ148:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ156
targ149:
	add x19, x19, 1
targ150:
	sub x19, x19, 1
targ151:
	sub x19, x19, 1
targ152:
	sub x19, x19, 1
targ153:
	add x19, x19, 1
targ154:
	add x19, x19, 1
targ155:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ156:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ148
targ157:
	sub x19, x19, 1
targ158:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ159:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ160:
	ldrb w0, [x19]
	bl _putchar
targ161:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ162:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ163:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ164:
	add x19, x19, 1
targ165:
	sub x19, x19, 1
targ166:
	sub x19, x19, 1
targ167:
; ignoring 'K'
targ168:
	add x19, x19, 1
targ169:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ170:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1511
targ171:
	sub x19, x19, 1
targ172:
; ignoring non-command character
targ173:
	ldrb w0, [x19]
	bl _putchar
targ174:
; ignoring 'z'
targ175:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ176:
	add x19, x19, 1
targ177:
	add x19, x19, 1
targ178:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ179:
; ignoring 'f'
targ180:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ181:
	sub x19, x19, 1
targ182:
	sub x19, x19, 1
targ183:
	sub x19, x19, 1
targ184:
	sub x19, x19, 1
targ185:
; ignoring '9'
targ186:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ187:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ188:
	sub x19, x19, 1
targ189:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ190:
	add x19, x19, 1
targ191:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ219
targ192:
; ignoring 'Y'
targ193:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ194:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ195:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ196:
	sub x19, x19, 1
targ197:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ198:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ218
targ199:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ216
targ200:
	sub x19, x19, 1
targ201:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ206
targ202:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ203:
; ignoring 'T'
targ204:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ205:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ206:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ201
targ207:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ208:
	sub x19, x19, 1
targ209:
	add x19, x19, 1
targ210:
; ignoring 'd'
targ211:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ212:
	add x19, x19, 1
targ213:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ214:
	bl _getchar
	strb w0, [x19]
targ215:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ216:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ199
targ217:
	add x19, x19, 1
targ218:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ198
targ219:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ191
targ220:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ221:
	ldrb w0, [x19]
	bl _putchar
targ222:
	sub x19, x19, 1
targ223:
	sub x19, x19, 1
targ224:
; ignoring 'D'
targ225:
	sub x19, x19, 1
targ226:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ227:
	sub x19, x19, 1
targ228:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1507
targ229:
	add x19, x19, 1
targ230:
; ignoring ' '
targ231:
	sub x19, x19, 1
targ232:
	bl _getchar
	strb w0, [x19]
targ233:
; ignoring 'L'
targ234:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ235:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ236:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ237:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1478
targ238:
	sub x19, x19, 1
targ239:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ240:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1476
targ241:
	add x19, x19, 1
targ242:
; ignoring non-command character
targ243:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ244:
	add x19, x19, 1
targ245:
; ignoring 'i'
targ246:
	ldrb w0, [x19]
	bl _putchar
targ247:
	sub x19, x19, 1
targ248:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ249:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1468
targ250:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ251:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ253
targ252:
; ignoring 'Y'
targ253:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ251
targ254:
	sub x19, x19, 1
targ255:
	sub x19, x19, 1
targ256:
	add x19, x19, 1
targ257:
	add x19, x19, 1
targ258:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ259:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1448
targ260:
	sub x19, x19, 1
targ261:
; ignoring 'g'
targ262:
	add x19, x19, 1
targ263:
; ignoring 'J'
targ264:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ265:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ266:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ267:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ268:
	add x19, x19, 1
targ269:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ270:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1442
targ271:
	sub x19, x19, 1
targ272:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ273:
; ignoring '2'
targ274:
	add x19, x19, 1
targ275:
	ldrb w0, [x19]
	bl _putchar
targ276:
	add x19, x19, 1
targ277:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ278:
	add x19, x19, 1
targ279:
	add x19, x19, 1
targ280:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ281:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1440
targ282:
; ignoring '9'
targ283:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ284:
	sub x19, x19, 1
targ285:
; ignoring 'u'
targ286:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ287:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ288:
	sub x19, x19, 1
targ289:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ290:
	add x19, x19, 1
targ291:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1438
targ292:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ293:
	sub x19, x19, 1
targ294:
; ignoring 'e'
targ295:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ303
targ296:
	add x19, x19, 1
targ297:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ299
targ298:
	add x19, x19, 1
targ299:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ297
targ300:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ301:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ302:
; ignoring 'a'
targ303:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ295
targ304:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1131
targ305:
	bl _getchar
	strb w0, [x19]
targ306:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ307:
; ignoring 'f'
targ308:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ759
targ309:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ310:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ756
targ311:
	sub x19, x19, 1
targ312:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ313:
; ignoring non-command character
targ314:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ315:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ742
targ316:
	sub x19, x19, 1
targ317:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ318:
; ignoring 'o'
targ319:
	add x19, x19, 1
targ320:
	sub x19, x19, 1
targ321:
; ignoring 'C'
targ322:
	sub x19, x19, 1
targ323:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ324:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ325:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ326:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ476
targ327:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ328:
; ignoring 'K'
targ329:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ330:
; ignoring 'v'
targ331:
	add x19, x19, 1
targ332:
	sub x19, x19, 1
targ333:
	sub x19, x19, 1
targ334:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ335:
; ignoring '8'
targ336:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ337:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ338:
	sub x19, x19, 1
targ339:
; ignoring 'P'
targ340:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ471
targ341:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ346
targ342:
	add x19, x19, 1
targ343:
	add x19, x19, 1
targ344:
	sub x19, x19, 1
targ345:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ346:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ341
targ347:
; ignoring '1'
targ348:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ461
targ349:
; ignoring 'c'
targ350:
	add x19, x19, 1
targ351:
	sub x19, x19, 1
targ352:
; ignoring 'J'
targ353:
	add x19, x19, 1
targ354:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ355:
	add x19, x19, 1
targ356:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ367
targ357:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ358:
	add x19, x19, 1
targ359:
	sub x19, x19, 1
targ360:
	add x19, x19, 1
targ361:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ362:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ363:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ364:
	sub x19, x19, 1
targ365:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ366:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ367:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ356
targ368:
	ldrb w0, [x19]
	bl _putchar
targ369:
; ignoring '3'
targ370:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ371:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ372:
; ignoring 'y'
targ373:
	sub x19, x19, 1
targ374:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ375
targ375:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ374
targ376:
; ignoring 'f'
targ377:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ436
targ378:
	sub x19, x19, 1
targ379:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ395
targ380:
; ignoring 'r'
targ381:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ382:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ391
targ383:
; ignoring 'v'
targ384:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ388
targ385:
	sub x19, x19, 1
targ386:
	sub x19, x19, 1
targ387:
	add x19, x19, 1
targ388:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ384
targ389:
	ldrb w0, [x19]
	bl _putchar
targ390:
	sub x19, x19, 1
targ391:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ382
targ392:
	ldrb w0, [x19]
	bl _putchar
targ393:
	add x19, x19, 1
targ394:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ395:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ379
targ396:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ432
targ397:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ398:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ419
targ399:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ400:
; ignoring non-command character
targ401:
	sub x19, x19, 1
targ402:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ403:
	add x19, x19, 1
targ404:
; ignoring 'd'
targ405:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ406:
	sub x19, x19, 1
targ407:
; ignoring 'c'
targ408:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ409:
; ignoring 'D'
targ410:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ411:
; ignoring 't'
targ412:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ413:
; ignoring 'e'
targ414:
	sub x19, x19, 1
targ415:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ416:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ417:
; ignoring 'N'
targ418:
	sub x19, x19, 1
targ419:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ398
targ420:
	add x19, x19, 1
targ421:
	sub x19, x19, 1
targ422:
	sub x19, x19, 1
targ423:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ424:
	add x19, x19, 1
targ425:
; ignoring '1'
targ426:
	sub x19, x19, 1
targ427:
	add x19, x19, 1
targ428:
	bl _getchar
	strb w0, [x19]
targ429:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ430:
	ldrb w0, [x19]
	bl _putchar
targ431:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ432:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ396
targ433:
	add x19, x19, 1
targ434:
	sub x19, x19, 1
targ435:
; ignoring 'K'
targ436:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ377
targ437:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ438:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ439:
	bl _getchar
	strb w0, [x19]
targ440:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ458
targ441:
	add x19, x19, 1
targ442:
	sub x19, x19, 1
targ443:
	sub x19, x19, 1
targ444:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ445:
	sub x19, x19, 1
targ446:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ447:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ448:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ449:
	sub x19, x19, 1
targ450:
	add x19, x19, 1
targ451:
	sub x19, x19, 1
targ452:
	add x19, x19, 1
targ453:
	sub x19, x19, 1
targ454:
	add x19, x19, 1
targ455:
	add x19, x19, 1
targ456:
	add x19, x19, 1
targ457:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ458:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ440
targ459:
	sub x19, x19, 1
targ460:
	sub x19, x19, 1
targ461:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ348
targ462:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ463:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ464:
; ignoring 'd'
targ465:
	ldrb w0, [x19]
	bl _putchar
targ466:
	add x19, x19, 1
targ467:
	sub x19, x19, 1
targ468:
	add x19, x19, 1
targ469:
	sub x19, x19, 1
targ470:
	add x19, x19, 1
targ471:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ340
targ472:
	add x19, x19, 1
targ473:
; ignoring 'J'
targ474:
	add x19, x19, 1
targ475:
; ignoring 'M'
targ476:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ326
targ477:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ478:
	add x19, x19, 1
targ479:
	ldrb w0, [x19]
	bl _putchar
targ480:
; ignoring 't'
targ481:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ482:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ483:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ484:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ485
targ485:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ484
targ486:
	sub x19, x19, 1
targ487:
; ignoring 'Z'
targ488:
	sub x19, x19, 1
targ489:
; ignoring 'z'
targ490:
	add x19, x19, 1
targ491:
	ldrb w0, [x19]
	bl _putchar
targ492:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ533
targ493:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ494:
; ignoring 'g'
targ495:
; ignoring non-command character
targ496:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ497:
; ignoring 'Q'
targ498:
	bl _getchar
	strb w0, [x19]
targ499:
	sub x19, x19, 1
targ500:
	sub x19, x19, 1
targ501:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ502:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ506
targ503:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ505
targ504:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ505:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ503
targ506:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ502
targ507:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ508:
; ignoring 'f'
targ509:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ510:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ530
targ511:
	sub x19, x19, 1
targ512:
	sub x19, x19, 1
targ513:
	add x19, x19, 1
targ514:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ515:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ516:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ517:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ518:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ519:
	sub x19, x19, 1
targ520:
	sub x19, x19, 1
targ521:
	sub x19, x19, 1
targ522:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ523:
	sub x19, x19, 1
targ524:
	add x19, x19, 1
targ525:
	add x19, x19, 1
targ526:
	add x19, x19, 1
targ527:
	add x19, x19, 1
targ528:
	add x19, x19, 1
targ529:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ530:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ510
targ531:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ532:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ533:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ492
targ534:
	sub x19, x19, 1
targ535:
; ignoring 'M'
targ536:
	add x19, x19, 1
targ537:
; ignoring 'w'
targ538:
	sub x19, x19, 1
targ539:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ540:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ541:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ738
targ542:
; ignoring '7'
targ543:
	sub x19, x19, 1
targ544:
; ignoring 'W'
targ545:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ546:
; ignoring 'R'
targ547:
	add x19, x19, 1
targ548:
; ignoring '7'
targ549:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ550:
	sub x19, x19, 1
targ551:
	add x19, x19, 1
targ552:
	add x19, x19, 1
targ553:
; ignoring '4'
targ554:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ649
targ555:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ556:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ641
targ557:
	sub x19, x19, 1
targ558:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ634
targ559:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ593
targ560:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ561:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ569
targ562:
	add x19, x19, 1
targ563:
	sub x19, x19, 1
targ564:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ565:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ566:
; ignoring 'R'
targ567:
	add x19, x19, 1
targ568:
; ignoring 'w'
targ569:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ561
targ570:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ580
targ571:
	add x19, x19, 1
targ572:
	sub x19, x19, 1
targ573:
	sub x19, x19, 1
targ574:
	sub x19, x19, 1
targ575:
	sub x19, x19, 1
targ576:
	add x19, x19, 1
targ577:
	add x19, x19, 1
targ578:
	add x19, x19, 1
targ579:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ580:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ570
targ581:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ582:
; ignoring 'M'
targ583:
	add x19, x19, 1
targ584:
; ignoring 'k'
targ585:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ591
targ586:
	sub x19, x19, 1
targ587:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ588:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ589:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ590:
; ignoring 'J'
targ591:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ585
targ592:
	sub x19, x19, 1
targ593:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ559
targ594:
	sub x19, x19, 1
targ595:
	sub x19, x19, 1
targ596:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ628
targ597:
; ignoring 'p'
targ598:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ599:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ616
targ600:
	add x19, x19, 1
targ601:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ602:
; ignoring 'p'
targ603:
	add x19, x19, 1
targ604:
; ignoring non-command character
targ605:
	add x19, x19, 1
targ606:
	sub x19, x19, 1
targ607:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ608:
	add x19, x19, 1
targ609:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ610:
	sub x19, x19, 1
targ611:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ614
targ612:
; ignoring '6'
targ613:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ614:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ611
targ615:
	sub x19, x19, 1
targ616:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ599
targ617:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ618:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ625
targ619:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ620:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ621:
	add x19, x19, 1
targ622:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ623:
	sub x19, x19, 1
targ624:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ625:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ618
targ626:
	add x19, x19, 1
targ627:
	add x19, x19, 1
targ628:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ596
targ629:
	add x19, x19, 1
targ630:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ631:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ632:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ633:
	sub x19, x19, 1
targ634:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ558
targ635:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ636:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ637:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ638:
; ignoring 'D'
targ639:
	sub x19, x19, 1
targ640:
; ignoring '1'
targ641:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ556
targ642:
; ignoring 'n'
targ643:
	add x19, x19, 1
targ644:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ646
targ645:
; ignoring 'o'
targ646:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ644
targ647:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ648:
	add x19, x19, 1
targ649:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ554
targ650:
	sub x19, x19, 1
targ651:
	sub x19, x19, 1
targ652:
	sub x19, x19, 1
targ653:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ654:
; ignoring 'a'
targ655:
	sub x19, x19, 1
targ656:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ668
targ657:
	add x19, x19, 1
targ658:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ659:
	add x19, x19, 1
targ660:
	sub x19, x19, 1
targ661:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ662:
	add x19, x19, 1
targ663:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ664:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ665:
	sub x19, x19, 1
targ666:
	sub x19, x19, 1
targ667:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ668:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ656
targ669:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ670:
; ignoring 'I'
targ671:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ690
targ672:
	add x19, x19, 1
targ673:
	sub x19, x19, 1
targ674:
	add x19, x19, 1
targ675:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ676:
	sub x19, x19, 1
targ677:
	add x19, x19, 1
targ678:
	add x19, x19, 1
targ679:
	add x19, x19, 1
targ680:
	sub x19, x19, 1
targ681:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ682:
	sub x19, x19, 1
targ683:
; ignoring 'Z'
targ684:
	add x19, x19, 1
targ685:
	add x19, x19, 1
targ686:
	bl _getchar
	strb w0, [x19]
targ687:
	add x19, x19, 1
targ688:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ689:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ690:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ671
targ691:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ692:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ711
targ693:
	sub x19, x19, 1
targ694:
; ignoring non-command character
targ695:
	add x19, x19, 1
targ696:
	sub x19, x19, 1
targ697:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ698:
	bl _getchar
	strb w0, [x19]
targ699:
	add x19, x19, 1
targ700:
; ignoring 'K'
targ701:
	sub x19, x19, 1
targ702:
; ignoring 'k'
targ703:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ704:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ705:
	add x19, x19, 1
targ706:
	sub x19, x19, 1
targ707:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ708:
	add x19, x19, 1
targ709:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ710:
; ignoring 'L'
targ711:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ692
targ712:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ713:
	add x19, x19, 1
targ714:
	ldrb w0, [x19]
	bl _putchar
targ715:
; ignoring 'z'
targ716:
	sub x19, x19, 1
targ717:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ718:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ719:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ720:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ721:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ722:
; ignoring '6'
targ723:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ736
targ724:
	add x19, x19, 1
targ725:
	add x19, x19, 1
targ726:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ735
targ727:
	bl _getchar
	strb w0, [x19]
targ728:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ729:
	add x19, x19, 1
targ730:
	add x19, x19, 1
targ731:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ732:
	add x19, x19, 1
targ733:
	add x19, x19, 1
targ734:
	sub x19, x19, 1
targ735:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ726
targ736:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ723
targ737:
; ignoring 'n'
targ738:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ541
targ739:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ740:
	sub x19, x19, 1
targ741:
; ignoring '0'
targ742:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ315
targ743:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ744:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ745:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ754
targ746:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ747:
	sub x19, x19, 1
targ748:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ749:
	sub x19, x19, 1
targ750:
	add x19, x19, 1
targ751:
	add x19, x19, 1
targ752:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ753:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ754:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ745
targ755:
	bl _getchar
	strb w0, [x19]
targ756:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ310
targ757:
	sub x19, x19, 1
targ758:
	sub x19, x19, 1
targ759:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ308
targ760:
; ignoring 'L'
targ761:
	sub x19, x19, 1
targ762:
; ignoring 'W'
targ763:
	sub x19, x19, 1
targ764:
	add x19, x19, 1
targ765:
	sub x19, x19, 1
targ766:
	sub x19, x19, 1
targ767:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ768:
; ignoring 'A'
targ769:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ770:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ771:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ772:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ773:
	sub x19, x19, 1
targ774:
; ignoring '6'
targ775:
	sub x19, x19, 1
targ776:
; ignoring 'M'
targ777:
; ignoring non-command character
targ778:
	sub x19, x19, 1
targ779:
	sub x19, x19, 1
targ780:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ781:
	add x19, x19, 1
targ782:
	add x19, x19, 1
targ783:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ784:
	sub x19, x19, 1
targ785:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1129
targ786:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ787:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ788:
; ignoring '9'
targ789:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ790:
	bl _getchar
	strb w0, [x19]
targ791:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ792:
; ignoring 'a'
targ793:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ794:
	add x19, x19, 1
targ795:
	add x19, x19, 1
targ796:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ797:
; ignoring 'C'
targ798:
	add x19, x19, 1
targ799:
	add x19, x19, 1
targ800:
; ignoring 't'
targ801:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ802:
; ignoring 'C'
targ803:
	sub x19, x19, 1
targ804:
	bl _getchar
	strb w0, [x19]
targ805:
	sub x19, x19, 1
targ806:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ807:
; ignoring ' '
targ808:
	sub x19, x19, 1
targ809:
; ignoring 'a'
targ810:
	sub x19, x19, 1
targ811:
	sub x19, x19, 1
targ812:
; ignoring '9'
targ813:
	sub x19, x19, 1
targ814:
	add x19, x19, 1
targ815:
	sub x19, x19, 1
targ816:
	sub x19, x19, 1
targ817:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ818:
; ignoring 'S'
targ819:
	bl _getchar
	strb w0, [x19]
targ820:
	add x19, x19, 1
targ821:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1128
targ822:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ823:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1109
targ824:
; ignoring 'I'
targ825:
	add x19, x19, 1
targ826:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ827:
	add x19, x19, 1
targ828:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ829:
; ignoring '5'
targ830:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ842
targ831:
	sub x19, x19, 1
targ832:
	add x19, x19, 1
targ833:
	sub x19, x19, 1
targ834:
	add x19, x19, 1
targ835:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ840
targ836:
	bl _getchar
	strb w0, [x19]
targ837:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ838:
	add x19, x19, 1
targ839:
	bl _getchar
	strb w0, [x19]
targ840:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ835
targ841:
; ignoring 'L'
targ842:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ830
targ843:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ844:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ845:
	add x19, x19, 1
targ846:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ847
targ847:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ846
targ848:
	add x19, x19, 1
targ849:
	sub x19, x19, 1
targ850:
; ignoring non-command character
targ851:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ852:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1074
targ853:
; ignoring 'Y'
targ854:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1035
targ855:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ856:
	add x19, x19, 1
targ857:
	add x19, x19, 1
targ858:
	sub x19, x19, 1
targ859:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ860:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ955
targ861:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ862:
	sub x19, x19, 1
targ863:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ895
targ864:
	sub x19, x19, 1
targ865:
	bl _getchar
	strb w0, [x19]
targ866:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ882
targ867:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ868:
	add x19, x19, 1
targ869:
	sub x19, x19, 1
targ870:
	add x19, x19, 1
targ871:
	sub x19, x19, 1
targ872:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ878
targ873:
; ignoring 'B'
targ874:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ875:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ876:
	sub x19, x19, 1
targ877:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ878:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ872
targ879:
	sub x19, x19, 1
targ880:
	sub x19, x19, 1
targ881:
	add x19, x19, 1
targ882:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ866
targ883:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ886
targ884:
	sub x19, x19, 1
targ885:
; ignoring 'H'
targ886:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ883
targ887:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ888:
	add x19, x19, 1
targ889:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ890:
	sub x19, x19, 1
targ891:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ892:
	add x19, x19, 1
targ893:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ894:
; ignoring '6'
targ895:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ863
targ896:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ951
targ897:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ944
targ898:
	add x19, x19, 1
targ899:
; ignoring 'M'
targ900:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ901:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ906
targ902:
	add x19, x19, 1
targ903:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ904:
; ignoring '8'
targ905:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ906:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ901
targ907:
; ignoring 'C'
targ908:
	sub x19, x19, 1
targ909:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ910:
	add x19, x19, 1
targ911:
; ignoring '8'
targ912:
	bl _getchar
	strb w0, [x19]
targ913:
	sub x19, x19, 1
targ914:
	sub x19, x19, 1
targ915:
	add x19, x19, 1
targ916:
	sub x19, x19, 1
targ917:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ930
targ918:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ919:
	sub x19, x19, 1
targ920:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ921:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ922:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ923:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ924:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ925:
	add x19, x19, 1
targ926:
	add x19, x19, 1
targ927:
	sub x19, x19, 1
targ928:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ929:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ930:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ917
targ931:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ932:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ937
targ933:
; ignoring 'Y'
targ934:
; ignoring non-command character
targ935:
	sub x19, x19, 1
targ936:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ937:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ932
targ938:
	ldrb w0, [x19]
	bl _putchar
targ939:
	add x19, x19, 1
targ940:
	add x19, x19, 1
targ941:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ942:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ943:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ944:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ897
targ945:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ946:
	sub x19, x19, 1
targ947:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ948:
	sub x19, x19, 1
targ949:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ950:
; ignoring 'g'
targ951:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ896
targ952:
; ignoring '7'
targ953:
	add x19, x19, 1
targ954:
	add x19, x19, 1
targ955:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ860
targ956:
; ignoring 'K'
targ957:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ958:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1028
targ959:
	sub x19, x19, 1
targ960:
; ignoring 'G'
targ961:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ962:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ963:
	add x19, x19, 1
targ964:
	add x19, x19, 1
targ965:
	add x19, x19, 1
targ966:
	add x19, x19, 1
targ967:
	sub x19, x19, 1
targ968:
; ignoring '0'
targ969:
	add x19, x19, 1
targ970:
; ignoring 'F'
targ971:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ983
targ972:
	sub x19, x19, 1
targ973:
	sub x19, x19, 1
targ974:
; ignoring 'y'
targ975:
	sub x19, x19, 1
targ976:
	add x19, x19, 1
targ977:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ978:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ979:
; ignoring 'T'
targ980:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ981:
; ignoring 'K'
targ982:
	add x19, x19, 1
targ983:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ971
targ984:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1014
targ985:
	sub x19, x19, 1
targ986:
	bl _getchar
	strb w0, [x19]
targ987:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ988:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1009
targ989:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1004
targ990:
	add x19, x19, 1
targ991:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ992:
; ignoring 'X'
targ993:
	add x19, x19, 1
targ994:
	sub x19, x19, 1
targ995:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ996:
	sub x19, x19, 1
targ997:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ998:
; ignoring 'F'
targ999:
	sub x19, x19, 1
targ1000:
	add x19, x19, 1
targ1001:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1002:
; ignoring 'T'
targ1003:
	sub x19, x19, 1
targ1004:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ989
targ1005:
	sub x19, x19, 1
targ1006:
; ignoring 'Z'
targ1007:
	add x19, x19, 1
targ1008:
; ignoring non-command character
targ1009:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ988
targ1010:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1011:
	sub x19, x19, 1
targ1012:
	add x19, x19, 1
targ1013:
; ignoring 'E'
targ1014:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ984
targ1015:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1016:
	bl _getchar
	strb w0, [x19]
targ1017:
; ignoring '8'
targ1018:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1019:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1020:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1021:
; ignoring 'H'
targ1022:
	sub x19, x19, 1
targ1023:
	sub x19, x19, 1
targ1024:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1025:
	sub x19, x19, 1
targ1026:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1027:
; ignoring 'V'
targ1028:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ958
targ1029:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1030:
	ldrb w0, [x19]
	bl _putchar
targ1031:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1032:
; ignoring 'C'
targ1033:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1034:
	add x19, x19, 1
targ1035:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ854
targ1036:
	sub x19, x19, 1
targ1037:
	sub x19, x19, 1
targ1038:
; ignoring '9'
targ1039:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1040:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1041:
	sub x19, x19, 1
targ1042:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1043:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1044:
; ignoring 't'
targ1045:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1046:
; ignoring 'L'
targ1047:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1072
targ1048:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1049:
	add x19, x19, 1
targ1050:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1051:
	sub x19, x19, 1
targ1052:
; ignoring 'a'
targ1053:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1070
targ1054:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1055:
	sub x19, x19, 1
targ1056:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1057:
	sub x19, x19, 1
targ1058:
; ignoring 'X'
targ1059:
	add x19, x19, 1
targ1060:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1061:
	add x19, x19, 1
targ1062:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1063:
	sub x19, x19, 1
targ1064:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1065:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1066:
	add x19, x19, 1
targ1067:
; ignoring 'K'
targ1068:
	add x19, x19, 1
targ1069:
; ignoring 'A'
targ1070:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1053
targ1071:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1072:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1047
targ1073:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1074:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ852
targ1075:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1076:
	sub x19, x19, 1
targ1077:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1078:
	add x19, x19, 1
targ1079:
	sub x19, x19, 1
targ1080:
	sub x19, x19, 1
targ1081:
; ignoring 'f'
targ1082:
; ignoring non-command character
targ1083:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1084:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1106
targ1085:
	sub x19, x19, 1
targ1086:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1087:
	sub x19, x19, 1
targ1088:
; ignoring 'X'
targ1089:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1090:
	add x19, x19, 1
targ1091:
	add x19, x19, 1
targ1092:
; ignoring 'u'
targ1093:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1094
targ1094:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1093
targ1095:
	add x19, x19, 1
targ1096:
	sub x19, x19, 1
targ1097:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1098:
	sub x19, x19, 1
targ1099:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1100:
	add x19, x19, 1
targ1101:
	ldrb w0, [x19]
	bl _putchar
targ1102:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1103:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1104:
	sub x19, x19, 1
targ1105:
	add x19, x19, 1
targ1106:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1084
targ1107:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1108:
; ignoring 'i'
targ1109:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ823
targ1110:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1111:
; ignoring 'v'
targ1112:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1113:
	sub x19, x19, 1
targ1114:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1115:
	add x19, x19, 1
targ1116:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1117:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1121
targ1118:
; ignoring 'u'
targ1119:
	sub x19, x19, 1
targ1120:
; ignoring 'g'
targ1121:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1117
targ1122:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1123:
; ignoring 'h'
targ1124:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1125:
; ignoring 'J'
targ1126:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1127:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1128:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ821
targ1129:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ785
targ1130:
	bl _getchar
	strb w0, [x19]
targ1131:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ304
targ1132:
; ignoring '9'
targ1133:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1137
targ1134:
	ldrb w0, [x19]
	bl _putchar
targ1135:
	bl _getchar
	strb w0, [x19]
targ1136:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1137:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1133
targ1138:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1141
targ1139:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1140:
; ignoring '1'
targ1141:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1138
targ1142:
; ignoring 'x'
targ1143:
	sub x19, x19, 1
targ1144:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1436
targ1145:
; ignoring 'J'
targ1146:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1147:
	ldrb w0, [x19]
	bl _putchar
targ1148:
; ignoring 'O'
targ1149:
	add x19, x19, 1
targ1150:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1385
targ1151:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1169
targ1152:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1153:
	add x19, x19, 1
targ1154:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1155:
; ignoring 'P'
targ1156:
	add x19, x19, 1
targ1157:
; ignoring 'h'
targ1158:
; ignoring non-command character
targ1159:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1160:
; ignoring 'q'
targ1161:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1162:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1163:
; ignoring 'F'
targ1164:
	add x19, x19, 1
targ1165:
	add x19, x19, 1
targ1166:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1167:
; ignoring 'S'
targ1168:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1169:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1151
targ1170:
; ignoring '5'
targ1171:
	sub x19, x19, 1
targ1172:
; ignoring '8'
targ1173:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1174:
; ignoring 'P'
targ1175:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1182
targ1176:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1177:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1178:
	sub x19, x19, 1
targ1179:
	sub x19, x19, 1
targ1180:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1181:
; ignoring 'U'
targ1182:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1175
targ1183:
; ignoring 'y'
targ1184:
	add x19, x19, 1
targ1185:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1186:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1187:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1208
targ1188:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1189:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1190:
; ignoring 'u'
targ1191:
	add x19, x19, 1
targ1192:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1193:
	ldrb w0, [x19]
	bl _putchar
targ1194:
	add x19, x19, 1
targ1195:
	ldrb w0, [x19]
	bl _putchar
targ1196:
	sub x19, x19, 1
targ1197:
	sub x19, x19, 1
targ1198:
	add x19, x19, 1
targ1199:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1200:
	sub x19, x19, 1
targ1201:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1202:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1203:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1206
targ1204:
; ignoring 'A'
targ1205:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1206:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1203
targ1207:
; ignoring '0'
targ1208:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1187
targ1209:
	ldrb w0, [x19]
	bl _putchar
targ1210:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1211:
	add x19, x19, 1
targ1212:
	add x19, x19, 1
targ1213:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1214:
; ignoring 'd'
targ1215:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1216:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1374
targ1217:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1218:
	add x19, x19, 1
targ1219:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1220:
	sub x19, x19, 1
targ1221:
	add x19, x19, 1
targ1222:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1371
targ1223:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1224:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1225:
	bl _getchar
	strb w0, [x19]
targ1226:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1363
targ1227:
	add x19, x19, 1
targ1228:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1229:
	sub x19, x19, 1
targ1230:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1231:
; ignoring non-command character
targ1232:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1234
targ1233:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1234:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1232
targ1235:
; ignoring 'U'
targ1236:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1237:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1238:
; ignoring 'V'
targ1239:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1347
targ1240:
	add x19, x19, 1
targ1241:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1242:
; ignoring 'L'
targ1243:
	sub x19, x19, 1
targ1244:
	add x19, x19, 1
targ1245:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1246:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1247:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1248:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1249:
	sub x19, x19, 1
targ1250:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1251:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1252:
	sub x19, x19, 1
targ1253:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1254:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1255:
	sub x19, x19, 1
targ1256:
	sub x19, x19, 1
targ1257:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1268
targ1258:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1259:
	add x19, x19, 1
targ1260:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1261:
	add x19, x19, 1
targ1262:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1263:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1264:
	sub x19, x19, 1
targ1265:
	sub x19, x19, 1
targ1266:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1267:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1268:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1257
targ1269:
	sub x19, x19, 1
targ1270:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1295
targ1271:
	add x19, x19, 1
targ1272:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1273:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1274:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1275:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1283
targ1276:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1277:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1278:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1279:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1280:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1281:
	add x19, x19, 1
targ1282:
	add x19, x19, 1
targ1283:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1275
targ1284:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1285:
; ignoring 'z'
targ1286:
	add x19, x19, 1
targ1287:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1288:
; ignoring 'V'
targ1289:
	sub x19, x19, 1
targ1290:
	add x19, x19, 1
targ1291:
	bl _getchar
	strb w0, [x19]
targ1292:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1293:
; ignoring 'C'
targ1294:
	add x19, x19, 1
targ1295:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1270
targ1296:
; ignoring 'w'
targ1297:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1298:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1345
targ1299:
; ignoring 'm'
targ1300:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1343
targ1301:
	add x19, x19, 1
targ1302:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1303:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1304:
; ignoring '6'
targ1305:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1306:
	sub x19, x19, 1
targ1307:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1308:
	add x19, x19, 1
targ1309:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1310:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1311:
	sub x19, x19, 1
targ1312:
	add x19, x19, 1
targ1313:
; ignoring non-command character
targ1314:
	sub x19, x19, 1
targ1315:
	bl _getchar
	strb w0, [x19]
targ1316:
	add x19, x19, 1
targ1317:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1318:
	sub x19, x19, 1
targ1319:
	sub x19, x19, 1
targ1320:
	sub x19, x19, 1
targ1321:
; ignoring 'k'
targ1322:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1323
targ1323:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1322
targ1324:
; ignoring 'f'
targ1325:
	sub x19, x19, 1
targ1326:
	add x19, x19, 1
targ1327:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1328:
	add x19, x19, 1
targ1329:
	sub x19, x19, 1
targ1330:
	sub x19, x19, 1
targ1331:
	add x19, x19, 1
targ1332:
; ignoring 'y'
targ1333:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1334:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1336
targ1335:
	add x19, x19, 1
targ1336:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1334
targ1337:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1338:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1339:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1340:
	add x19, x19, 1
targ1341:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1342:
	add x19, x19, 1
targ1343:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1300
targ1344:
	sub x19, x19, 1
targ1345:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1298
targ1346:
	sub x19, x19, 1
targ1347:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1239
targ1348:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1349:
	ldrb w2, [x19]
	cmp w2, 0
	b.eq targ1352
targ1350:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1351:
	add x19, x19, 1
targ1352:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1349
targ1353:
; ignoring 'N'
targ1354:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1355:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1356:
	add x19, x19, 1
targ1357:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1358:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1359:
; ignoring '1'
targ1360:
	sub x19, x19, 1
targ1361:
; ignoring 'A'
targ1362:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1363:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1226
targ1364:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1365:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1366:
	add x19, x19, 1
targ1367:
; ignoring 't'
targ1368:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1369:
; ignoring '9'
targ1370:
	sub x19, x19, 1
targ1371:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1222
targ1372:
	add x19, x19, 1
targ1373:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1374:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1216
targ1375:
	sub x19, x19, 1
targ1376:
; ignoring 'o'
targ1377:
	sub x19, x19, 1
targ1378:
	sub x19, x19, 1
targ1379:
; ignoring 'e'
targ1380:
	add x19, x19, 1
targ1381:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1382:
	sub x19, x19, 1
targ1383:
	sub x19, x19, 1
targ1384:
; ignoring non-command character
targ1385:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1150
targ1386:
; ignoring 'l'
targ1387:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1388:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1389:
	sub x19, x19, 1
targ1390:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1391:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1392:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1393:
; ignoring 'S'
targ1394:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1395:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1396:
	ldrb w0, [x19]
	bl _putchar
targ1397:
; ignoring 'G'
targ1398:
	sub x19, x19, 1
targ1399:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1400:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1401:
	sub x19, x19, 1
targ1402:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1403:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1404:
; ignoring '8'
targ1405:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1406:
; ignoring 'P'
targ1407:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1408:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1409:
	add x19, x19, 1
targ1410:
; ignoring '2'
targ1411:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1412:
; ignoring 'S'
targ1413:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1414:
	add x19, x19, 1
targ1415:
; ignoring 'V'
targ1416:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1417:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1418:
	add x19, x19, 1
targ1419:
; ignoring 'm'
targ1420:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1421:
	sub x19, x19, 1
targ1422:
; ignoring 'R'
targ1423:
	sub x19, x19, 1
targ1424:
	add x19, x19, 1
targ1425:
; ignoring 's'
targ1426:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1427:
	add x19, x19, 1
targ1428:
	sub x19, x19, 1
targ1429:
	add x19, x19, 1
targ1430:
	add x19, x19, 1
targ1431:
	add x19, x19, 1
targ1432:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1433:
	bl _getchar
	strb w0, [x19]
targ1434:
	sub x19, x19, 1
targ1435:
	add x19, x19, 1
targ1436:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ1144
targ1437:
; ignoring 'd'
targ1438:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ291
targ1439:
; ignoring 'P'
targ1440:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ281
targ1441:
	sub x19, x19, 1
targ1442:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ270
targ1443:
; ignoring 'T'
targ1444:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1445:
	sub x19, x19, 1
targ1446:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1447:
; ignoring 'P'
targ1448:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ259
targ1449:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1450:
	bl _getchar
	strb w0, [x19]
targ1451:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1452:
	add x19, x19, 1
targ1453:
	add x19, x19, 1
targ1454:
	sub x19, x19, 1
targ1455:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1456:
; ignoring 'D'
targ1457:
	bl _getchar
	strb w0, [x19]
targ1458:
	add x19, x19, 1
targ1459:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1460:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1461:
; ignoring non-command character
targ1462:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1463:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1464:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1465:
; ignoring 'b'
targ1466:
	add x19, x19, 1
targ1467:
; ignoring 't'
targ1468:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ249
targ1469:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1470:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1471:
; ignoring '0'
targ1472:
	sub x19, x19, 1
targ1473:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1474:
	sub x19, x19, 1
targ1475:
	sub x19, x19, 1
targ1476:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ240
targ1477:
	add x19, x19, 1
targ1478:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ237
targ1479:
; ignoring 'x'
targ1480:
	sub x19, x19, 1
targ1481:
; ignoring 's'
targ1482:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1483:
	add x19, x19, 1
targ1484:
	sub x19, x19, 1
targ1485:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1486:
	sub x19, x19, 1
targ1487:
; ignoring 'm'
targ1488:
	bl _getchar
	strb w0, [x19]
targ1489:
	sub x19, x19, 1
targ1490:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1491:
	add x19, x19, 1
targ1492:
; ignoring '2'
targ1493:
	add x19, x19, 1
targ1494:
	add x19, x19, 1
targ1495:
	sub x19, x19, 1
targ1496:
	sub x19, x19, 1
targ1497:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1498:
	add x19, x19, 1
targ1499:
; ignoring 'E'
targ1500:
	sub x19, x19, 1
targ1501:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1502:
	sub x19, x19, 1
targ1503:
	sub x19, x19, 1
targ1504:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1505:
; ignoring 'E'
targ1506:
	add x19, x19, 1
targ1507:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ228
targ1508:
; ignoring 'i'
targ1509:
	ldrb w2, [x19]
	sub w2, w2, 1
	strb w2, [x19]
targ1510:
	ldrb w2, [x19]
	add w2, w2, 1
	strb w2, [x19]
targ1511:
	ldrb w2, [x19]
	cmp w2, 0
	b.ne targ170
targ1512:
; ignoring non-command character
targ1513:
; ignoring non-command character
targ1514:
	ldr     x19, [sp, #16]
	ldp     x29, x30, [sp], #32
	ret
