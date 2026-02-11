namespace CadastroPOO
{
    partial class ale
    {
        /// <summary>
        /// Variável de designer necessária.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpar os recursos que estão sendo usados.
        /// </summary>
        /// <param name="disposing">true se for necessário descartar os recursos gerenciados; caso contrário, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código gerado pelo Windows Form Designer

        /// <summary>
        /// Método necessário para suporte ao Designer - não modifique 
        /// o conteúdo deste método com o editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.txtNome = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.txtCPF = new System.Windows.Forms.TextBox();
            this.txtEmail = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txtSenha = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.btnRemover = new System.Windows.Forms.Button();
            this.DtNascimento = new System.Windows.Forms.DateTimePicker();
            this.BtnAdicionar = new System.Windows.Forms.Button();
            this.label7 = new System.Windows.Forms.Label();
            this.txtVisCpf = new System.Windows.Forms.TextBox();
            this.txtVisNome = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.txtVisNascimento = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.txtVisIdade = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txtVisEmail = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.txtVisSenha = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.listUsuarios = new System.Windows.Forms.ListBox();
            this.SuspendLayout();
            // 
            // txtNome
            // 
            this.txtNome.Location = new System.Drawing.Point(118, 39);
            this.txtNome.Name = "txtNome";
            this.txtNome.Size = new System.Drawing.Size(519, 22);
            this.txtNome.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(128, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(44, 16);
            this.label2.TabIndex = 2;
            this.label2.Text = "Nome";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(9, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(33, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "CPF";
            // 
            // txtCPF
            // 
            this.txtCPF.Location = new System.Drawing.Point(12, 39);
            this.txtCPF.Name = "txtCPF";
            this.txtCPF.Size = new System.Drawing.Size(100, 22);
            this.txtCPF.TabIndex = 1;
            // 
            // txtEmail
            // 
            this.txtEmail.Location = new System.Drawing.Point(12, 103);
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new System.Drawing.Size(402, 22);
            this.txtEmail.TabIndex = 5;
            this.txtEmail.TextChanged += new System.EventHandler(this.textBox3_TextChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(9, 79);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(41, 16);
            this.label3.TabIndex = 4;
            this.label3.Text = "Email";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(655, 18);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(133, 16);
            this.label4.TabIndex = 6;
            this.label4.Text = "Data de Nascimento ";
            // 
            // txtSenha
            // 
            this.txtSenha.Location = new System.Drawing.Point(452, 103);
            this.txtSenha.Name = "txtSenha";
            this.txtSenha.Size = new System.Drawing.Size(255, 22);
            this.txtSenha.TabIndex = 9;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(449, 79);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(46, 16);
            this.label5.TabIndex = 8;
            this.label5.Text = "Senha";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(4, 143);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(111, 16);
            this.label6.TabIndex = 10;
            this.label6.Text = "Lista de Usuários";
            // 
            // btnRemover
            // 
            this.btnRemover.Location = new System.Drawing.Point(713, 277);
            this.btnRemover.Name = "btnRemover";
            this.btnRemover.Size = new System.Drawing.Size(75, 23);
            this.btnRemover.TabIndex = 12;
            this.btnRemover.Text = "Remover";
            this.btnRemover.UseVisualStyleBackColor = true;
            this.btnRemover.Click += new System.EventHandler(this.btnRemover_Click);
            // 
            // DtNascimento
            // 
            this.DtNascimento.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.DtNascimento.Location = new System.Drawing.Point(658, 39);
            this.DtNascimento.Name = "DtNascimento";
            this.DtNascimento.Size = new System.Drawing.Size(112, 22);
            this.DtNascimento.TabIndex = 13;
            // 
            // BtnAdicionar
            // 
            this.BtnAdicionar.Location = new System.Drawing.Point(713, 102);
            this.BtnAdicionar.Name = "BtnAdicionar";
            this.BtnAdicionar.Size = new System.Drawing.Size(75, 23);
            this.BtnAdicionar.TabIndex = 14;
            this.BtnAdicionar.Text = "Adicionar";
            this.BtnAdicionar.UseVisualStyleBackColor = true;
            this.BtnAdicionar.Click += new System.EventHandler(this.BtnAdicionar_Click);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(12, 330);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(33, 16);
            this.label7.TabIndex = 15;
            this.label7.Text = "CPF";
            // 
            // txtVisCpf
            // 
            this.txtVisCpf.Location = new System.Drawing.Point(12, 360);
            this.txtVisCpf.Name = "txtVisCpf";
            this.txtVisCpf.Size = new System.Drawing.Size(100, 22);
            this.txtVisCpf.TabIndex = 16;
            // 
            // txtVisNome
            // 
            this.txtVisNome.Location = new System.Drawing.Point(131, 360);
            this.txtVisNome.Name = "txtVisNome";
            this.txtVisNome.Size = new System.Drawing.Size(427, 22);
            this.txtVisNome.TabIndex = 18;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(128, 330);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(44, 16);
            this.label8.TabIndex = 17;
            this.label8.Text = "Nome";
            // 
            // txtVisNascimento
            // 
            this.txtVisNascimento.Location = new System.Drawing.Point(564, 360);
            this.txtVisNascimento.Name = "txtVisNascimento";
            this.txtVisNascimento.Size = new System.Drawing.Size(100, 22);
            this.txtVisNascimento.TabIndex = 20;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(561, 330);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(111, 16);
            this.label9.TabIndex = 19;
            this.label9.Text = "Data Nascimento";
            // 
            // txtVisIdade
            // 
            this.txtVisIdade.Location = new System.Drawing.Point(676, 360);
            this.txtVisIdade.Name = "txtVisIdade";
            this.txtVisIdade.Size = new System.Drawing.Size(100, 22);
            this.txtVisIdade.TabIndex = 22;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(678, 330);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(45, 16);
            this.label10.TabIndex = 21;
            this.label10.Text = "idade:";
            // 
            // txtVisEmail
            // 
            this.txtVisEmail.Location = new System.Drawing.Point(12, 426);
            this.txtVisEmail.Name = "txtVisEmail";
            this.txtVisEmail.Size = new System.Drawing.Size(450, 22);
            this.txtVisEmail.TabIndex = 24;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(12, 396);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(41, 16);
            this.label11.TabIndex = 23;
            this.label11.Text = "Email";
            // 
            // txtVisSenha
            // 
            this.txtVisSenha.Location = new System.Drawing.Point(482, 426);
            this.txtVisSenha.Name = "txtVisSenha";
            this.txtVisSenha.Size = new System.Drawing.Size(100, 22);
            this.txtVisSenha.TabIndex = 26;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(479, 396);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(46, 16);
            this.label12.TabIndex = 25;
            this.label12.Text = "Senha";
            // 
            // listUsuarios
            // 
            this.listUsuarios.FormattingEnabled = true;
            this.listUsuarios.ItemHeight = 16;
            this.listUsuarios.Location = new System.Drawing.Point(7, 162);
            this.listUsuarios.Name = "listUsuarios";
            this.listUsuarios.Size = new System.Drawing.Size(692, 132);
            this.listUsuarios.TabIndex = 27;
            this.listUsuarios.DoubleClick += new System.EventHandler(this.listUsuarios_DoubleClick);
            // 
            // ale
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.listUsuarios);
            this.Controls.Add(this.txtVisSenha);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.txtVisEmail);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.txtVisIdade);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.txtVisNascimento);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.txtVisNome);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.txtVisCpf);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.BtnAdicionar);
            this.Controls.Add(this.DtNascimento);
            this.Controls.Add(this.btnRemover);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtSenha);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtEmail);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtNome);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtCPF);
            this.Controls.Add(this.label1);
            this.Name = "ale";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtNome;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtCPF;
        private System.Windows.Forms.TextBox txtEmail;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtSenha;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button btnRemover;
        private System.Windows.Forms.DateTimePicker DtNascimento;
        private System.Windows.Forms.Button BtnAdicionar;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txtVisCpf;
        private System.Windows.Forms.TextBox txtVisNome;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox txtVisNascimento;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtVisIdade;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox txtVisEmail;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox txtVisSenha;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.ListBox listUsuarios;
    }
}

