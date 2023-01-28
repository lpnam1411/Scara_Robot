//-------------------------------- STEPPER MOTOR --------------------------------
#define motorInterfaceType 1 // mode 1 thư viện accel

#define N 2 // Số lượng động cơ bước

//------------ STEP 1 ------------
#define stepL1 6    // dây động cơ bên trái
#define dirL1 3     // dây động cơ bên trái
#define swLimit1 10 // dây số 9

//------------ STEP 2 ------------
#define stepL2 7    // dây động cơ bên phải
#define dirL2 4     // dây động cơ bên phải
#define swLimit2 11 // dây số 8

const int step[N] = {stepL1, stepL2};        // list chân step
const int dir[N] = {dirL1, dirL2};           // list chân dir
const int swLimit[N] = {swLimit1, swLimit2}; // list công tắc hành trình
int accel[N];                                // Gia tốc của động cơ
long degToGo[N];                             // Số góc nhập vào

//#define numLine 1
#define numDeg 88*2
long degGo[numDeg] = {
-650,1081,
-3600, -3600,
14,-18,
14,-18,
14,-19,
14,-19,
14,-19,
14,-20,
15,-20,
15,-21,
15,-21,
15,-22,
15,-22,
15,-23,
16,-24,
16,-24,
16,-25,
17,-26,
17,-27,
18,-28,
18,-29,
19,-31,
19,-32,
20,-34,
21,-36,
22,-39,
24,-42,
26,-47,
29,-53,
34,-63,
43,-82,
99,-197,
0,0,
-93,197,
-37,82,
-27,63,
-22,53,
-19,47,
-17,42,
-15,39,
-14,36,
-13,34,
-12,32,
-11,31,
-10,29,
-10,28,
-9,27,
-8,26,
-8,25,
-7,24,
-7,24,
-7,23,
-6,22,
-6,22,
-6,21,
-5,21,
-5,20,
-5,20,
-4,19,
-4,19,
-4,19,
-3,18,
-3,18,
3600,3600,
389,-1065,
-3600,-3600,
0,0,
7,2,
7,2,
7,2,
7,2,
7,1,
7,1,
7,1,
7,1,
7,0,
8,0,
8,-0,
8,-0,
8,-1,
8,-1,
8,-1,
8,-1,
8,-2,
8,-2,
9,-2,
9,-2,
3600,3600}; //endDEG
long index = 0; //chỉ số chạy mảng nhập sẵn


long stepToGo[N];                            // Số bước cần di chuyển
#define degHome1 -98* microStep * ratioPuley / 1.8                           // số góc từ công tắc hành trình về giữa
#define degHome2 -94* microStep * ratioPuley / 1.8                           // số góc từ công tắc hành trình về giữa

#define en 8 // chân en động cơ, LOW chạy HIGH tắt

//------------ Phần cứng ------------
#define microStep 16   // Vi bước sử dụng
#define ratioPuley 1.5 // Tỉ số truyền đai pulley

//------------ Tốc độ ------------
#define MAXSPEED 500 // Vận tốc lớn nhất động cơ có thể đạt được
#define MAXACCEL 60  // Gia tốc lớn nhất động cơ có thể đạt được

//-------------------------------- RC SERVO --------------------------------

//------------ SERVO ------------
#define pinServo 9 // dây số 7

#define posMax 180 // vị trí cao nhất L3
#define posMin 0   // vị trí thấp nhất L3

int posWrite; // vị trí hoạt đông của L3
//------------ BIẾN TRỞ ------------
#define pinRes A0 // dây số 6

#define resMin 290 // giá trị min ổn định biến trở
#define resMax 500 // giá trị max ổn định biến trở
