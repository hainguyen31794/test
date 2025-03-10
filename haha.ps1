$s = '[DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)] public static extern short GetAsyncKeyState(int virtualKeyCode);';
Add-Type -MemberDefinition '[DllImport("user32.dll")] public static extern void mouse_event(int flags, int dx, int dy, int cButtons, int info);' -Name U32 -Namespace W;
$A = Add-Type -MemberDefinition $s -Name 'Keypress' -Namespace API -PassThru;
function f([int]$x, [int]$y, [bool]$dC, [string]$k = "") { [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y); if ($dC) { [W.U32]::mouse_event(6, 0, 0, 0, 0); [W.U32]::mouse_event(6, 0, 0, 0, 0); }    else { [W.U32]::mouse_event(6, 0, 0, 0, 0); }    if ($k) { Start-Sleep -Milliseconds 100; [System.Windows.Forms.SendKeys]::SendWait($k); }    Start-Sleep -Milliseconds 100; }
Add-Type -assembly System.Windows.Forms;
function hpbd([string]$t) {
    $m = New-Object System.Windows.Forms.Form;
    $m.Text = 'iloveyou173';
    $m.Width = 480;
    $m.Height = 200;
    $l = New-Object System.Windows.Forms.Label;
    $l.Location = New-Object System.Drawing.Size(0, 0);
    $l.Size = New-Object System.Drawing.Size(480, 200);
    $l.Font = [System.Drawing.Font]::new("Ink Free", 50, [System.Drawing.FontStyle]::Bold);
    $l.BackColor = "#F6E6C2"; $l.ForeColor = "#FFAACF";
    $l.Text = $t; $m.Controls.Add($l);
    $m.ShowDialog();
}
$d = Get-Date;

if ($d.month -eq 3 -and $d.Day -eq 17 ) 
{ hpbd "♥♥♥ Happy Birthday ♥♥♥"; }
if ($d.month -eq 3 -and $d.Day -eq 17 ) 
{ hpbd "♥♥♥ Happy Birthday ♥♥♥"; }

# Đọc file CSV data HEIGHT
$data = Import-Csv -Path "C:\\Users\\haing\\Downloads\\New Text Document 2\\data.csv"

while (1) { 
    # di chuyển chuột để quét mã vạch
    if ($A::GetAsyncKeyState(192) -eq -32767) {
        f 130 100 $true ;
    }
    # lăp xử lí hoàn thành    
    if ($A::GetAsyncKeyState(113) -eq -32767) {         
        while (1) {             
            # f 796 231 $true "^{c}";            
            # $x = Get-Clipboard; 
            # if ($x.Length -gt 10) { break; } 




            #copy lấy thông tin 
            [System.Windows.Forms.SendKeys]::SendWait("^{c}");
            $line = Get-Clipboard;
            $elements = $line -split "\t";
            #Lấy thông tin loại dây
            $day = $elements[9] + [float]$elements[10];

            #Lấy thông tin TML
            $tml1 = $elements[16];
            $tml2 = $elements[19];
            
            #Lâý thông tin chiều dài
            $chieu_dai = $elements[12] ;

            # Tìm kiếm theo 2 giá trị
            $html1 = $data | Where-Object { $_.TML -eq $tml1 -and $_.WIRE -eq $day };
            $html2 = $data | Where-Object { $_.TML -eq $tml2 -and $_.WIRE -eq $day };
            # Lấy số ngẫu nhiên từ 0 đến 9
            $randomNumber1 = Get-Random -Minimum -10 -Maximum 10;
            $randomNumber2 = Get-Random -Minimum -10 -Maximum 10;

            # Chia cho 1000 và cộng HEIGHT
            $result1 = ($randomNumber1 / 1000) + [float]$html1.HEIGHT;
            $resultRounded1 = [math]::Round($result1, 3);

            $result2 = ($randomNumber2 / 1000) + [float]$html2.HEIGHT;
            $resultRounded2 = [math]::Round($result2, 3);

            #click Lực ép trái phải
            f 207 562 $false ""; f 208 582 $false "";
            [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
            if ($A::GetAsyncKeyState(114) -eq -32767) { break; }
            Start-Sleep -Milliseconds 100;
            [System.Windows.Forms.SendKeys]::SendWait($resultRounded1)
            if ($A::GetAsyncKeyState(114) -eq -32767) { break; }
            Start-Sleep -Milliseconds 100;
            [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
            if ($A::GetAsyncKeyState(114) -eq -32767) { break; }
            Start-Sleep -Milliseconds 100;
            [System.Windows.Forms.SendKeys]::SendWait($resultRounded2)
            if ($A::GetAsyncKeyState(114) -eq -32767) { break; }
            Start-Sleep -Milliseconds 100;
            [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
            if ($A::GetAsyncKeyState(114) -eq -32767) { break; }
            Start-Sleep -Milliseconds 100;
            [System.Windows.Forms.SendKeys]::SendWait($chieu_dai)
            if ($A::GetAsyncKeyState(114) -eq -32767) { break; }
            Start-Sleep -Milliseconds 100;
            [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
            if ($A::GetAsyncKeyState(114) -eq -32767) { break; }
            Start-Sleep -Milliseconds 100;
            [System.Windows.Forms.SendKeys]::SendWait("{Enter}")
            if ($A::GetAsyncKeyState(114) -eq -32767) { break; }
            Start-Sleep -Milliseconds 100;
            [System.Windows.Forms.SendKeys]::SendWait("{Enter}")
            if ($A::GetAsyncKeyState(114) -eq -32767) { break; }
            Start-Sleep -Milliseconds 100;
            if ($A::GetAsyncKeyState(114) -eq -32767) { break; }
            f 1538 138 $false "{Enter}";  
            if ($A::GetAsyncKeyState(114) -eq -32767) { break; }
            Start-Sleep -Milliseconds 100;
        }     
    } 
}
