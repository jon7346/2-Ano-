namespace AppMetodoFuncao
{
    partial class Form1
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
            this.label1 = new System.Windows.Forms.Label();
            this.cbbOpcoes = new System.Windows.Forms.ComboBox();
            this.btnIF = new System.Windows.Forms.Button();
            this.btnSwitch = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.txtValor1 = new System.Windows.Forms.TextBox();
            this.txtValor2 = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.btnMetodo = new System.Windows.Forms.Button();
            this.btnFuncao = new System.Windows.Forms.Button();
            this.btnFOR = new System.Windows.Forms.Button();
            this.btnWHILE = new System.Windows.Forms.Button();
            this.btnDoWHILE = new System.Windows.Forms.Button();
            this.lstItens = new System.Windows.Forms.ListBox();
            this.btnLimpar = new System.Windows.Forms.Button();
            this.txtInfo = new System.Windows.Forms.TextBox();
            this.btnSoNumero = new System.Windows.Forms.Button();
            this.lblResultado = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(15, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(42, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Opção:";
            // 
            // cbbOpcoes
            // 
            this.cbbOpcoes.FormattingEnabled = true;
            this.cbbOpcoes.Items.AddRange(new object[] {
            "MC FISH",
            "BIG TASTY",
            "BIG MAC",
            "QUARTEIRAO"});
            this.cbbOpcoes.Location = new System.Drawing.Point(18, 31);
            this.cbbOpcoes.Name = "cbbOpcoes";
            this.cbbOpcoes.Size = new System.Drawing.Size(121, 21);
            this.cbbOpcoes.TabIndex = 1;
            // 
            // btnIF
            // 
            this.btnIF.Location = new System.Drawing.Point(18, 58);
            this.btnIF.Name = "btnIF";
            this.btnIF.Size = new System.Drawing.Size(75, 23);
            this.btnIF.TabIndex = 2;
            this.btnIF.Text = "IF";
            this.btnIF.UseVisualStyleBackColor = true;
            this.btnIF.Click += new System.EventHandler(this.btnIF_Click);
            // 
            // btnSwitch
            // 
            this.btnSwitch.Location = new System.Drawing.Point(18, 87);
            this.btnSwitch.Name = "btnSwitch";
            this.btnSwitch.Size = new System.Drawing.Size(75, 23);
            this.btnSwitch.TabIndex = 3;
            this.btnSwitch.Text = "SWITCH";
            this.btnSwitch.UseVisualStyleBackColor = true;
            this.btnSwitch.Click += new System.EventHandler(this.btnSwitch_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(201, 21);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(43, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Valor 1:";
            // 
            // txtValor1
            // 
            this.txtValor1.Location = new System.Drawing.Point(204, 37);
            this.txtValor1.Name = "txtValor1";
            this.txtValor1.Size = new System.Drawing.Size(100, 20);
            this.txtValor1.TabIndex = 5;
            // 
            // txtValor2
            // 
            this.txtValor2.Location = new System.Drawing.Point(204, 87);
            this.txtValor2.Name = "txtValor2";
            this.txtValor2.Size = new System.Drawing.Size(100, 20);
            this.txtValor2.TabIndex = 7;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(201, 71);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(40, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "Valor2:";
            // 
            // btnMetodo
            // 
            this.btnMetodo.Location = new System.Drawing.Point(334, 37);
            this.btnMetodo.Name = "btnMetodo";
            this.btnMetodo.Size = new System.Drawing.Size(75, 23);
            this.btnMetodo.TabIndex = 8;
            this.btnMetodo.Text = "METODO";
            this.btnMetodo.UseVisualStyleBackColor = true;
            this.btnMetodo.Click += new System.EventHandler(this.btnMetodo_Click);
            // 
            // btnFuncao
            // 
            this.btnFuncao.Location = new System.Drawing.Point(334, 66);
            this.btnFuncao.Name = "btnFuncao";
            this.btnFuncao.Size = new System.Drawing.Size(75, 23);
            this.btnFuncao.TabIndex = 9;
            this.btnFuncao.Text = "FUNCAO";
            this.btnFuncao.UseVisualStyleBackColor = true;
            this.btnFuncao.Click += new System.EventHandler(this.btnFuncao_Click);
            // 
            // btnFOR
            // 
            this.btnFOR.Location = new System.Drawing.Point(451, 11);
            this.btnFOR.Name = "btnFOR";
            this.btnFOR.Size = new System.Drawing.Size(75, 23);
            this.btnFOR.TabIndex = 10;
            this.btnFOR.Text = "FOR";
            this.btnFOR.UseVisualStyleBackColor = true;
            this.btnFOR.Click += new System.EventHandler(this.btnFOR_Click);
            // 
            // btnWHILE
            // 
            this.btnWHILE.Location = new System.Drawing.Point(451, 40);
            this.btnWHILE.Name = "btnWHILE";
            this.btnWHILE.Size = new System.Drawing.Size(75, 23);
            this.btnWHILE.TabIndex = 11;
            this.btnWHILE.Text = "WHILE";
            this.btnWHILE.UseVisualStyleBackColor = true;
            this.btnWHILE.Click += new System.EventHandler(this.btnWHILE_Click);
            // 
            // btnDoWHILE
            // 
            this.btnDoWHILE.Location = new System.Drawing.Point(451, 69);
            this.btnDoWHILE.Name = "btnDoWHILE";
            this.btnDoWHILE.Size = new System.Drawing.Size(75, 23);
            this.btnDoWHILE.TabIndex = 12;
            this.btnDoWHILE.Text = "DO WHILE";
            this.btnDoWHILE.UseVisualStyleBackColor = true;
            this.btnDoWHILE.Click += new System.EventHandler(this.btnDoWHILE_Click);
            // 
            // lstItens
            // 
            this.lstItens.FormattingEnabled = true;
            this.lstItens.Location = new System.Drawing.Point(532, 12);
            this.lstItens.Name = "lstItens";
            this.lstItens.Size = new System.Drawing.Size(120, 134);
            this.lstItens.TabIndex = 13;
            // 
            // btnLimpar
            // 
            this.btnLimpar.Location = new System.Drawing.Point(451, 98);
            this.btnLimpar.Name = "btnLimpar";
            this.btnLimpar.Size = new System.Drawing.Size(75, 23);
            this.btnLimpar.TabIndex = 14;
            this.btnLimpar.Text = "LIMPAR";
            this.btnLimpar.UseVisualStyleBackColor = true;
            this.btnLimpar.Click += new System.EventHandler(this.btnLimpar_Click);
            // 
            // txtInfo
            // 
            this.txtInfo.Location = new System.Drawing.Point(675, 15);
            this.txtInfo.Name = "txtInfo";
            this.txtInfo.Size = new System.Drawing.Size(100, 20);
            this.txtInfo.TabIndex = 15;
            // 
            // btnSoNumero
            // 
            this.btnSoNumero.Location = new System.Drawing.Point(675, 40);
            this.btnSoNumero.Name = "btnSoNumero";
            this.btnSoNumero.Size = new System.Drawing.Size(100, 23);
            this.btnSoNumero.TabIndex = 16;
            this.btnSoNumero.Text = "SO NUMERO";
            this.btnSoNumero.UseVisualStyleBackColor = true;
            this.btnSoNumero.Click += new System.EventHandler(this.btnSoNumero_Click);
            // 
            // lblResultado
            // 
            this.lblResultado.AutoSize = true;
            this.lblResultado.Location = new System.Drawing.Point(672, 68);
            this.lblResultado.Name = "lblResultado";
            this.lblResultado.Size = new System.Drawing.Size(35, 13);
            this.lblResultado.TabIndex = 17;
            this.lblResultado.Text = "label4";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(834, 170);
            this.Controls.Add(this.lblResultado);
            this.Controls.Add(this.btnSoNumero);
            this.Controls.Add(this.txtInfo);
            this.Controls.Add(this.btnLimpar);
            this.Controls.Add(this.lstItens);
            this.Controls.Add(this.btnDoWHILE);
            this.Controls.Add(this.btnWHILE);
            this.Controls.Add(this.btnFOR);
            this.Controls.Add(this.btnFuncao);
            this.Controls.Add(this.btnMetodo);
            this.Controls.Add(this.txtValor2);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtValor1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnSwitch);
            this.Controls.Add(this.btnIF);
            this.Controls.Add(this.cbbOpcoes);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "7777777777";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbbOpcoes;
        private System.Windows.Forms.Button btnIF;
        private System.Windows.Forms.Button btnSwitch;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtValor1;
        private System.Windows.Forms.TextBox txtValor2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnMetodo;
        private System.Windows.Forms.Button btnFuncao;
        private System.Windows.Forms.Button btnFOR;
        private System.Windows.Forms.Button btnWHILE;
        private System.Windows.Forms.Button btnDoWHILE;
        private System.Windows.Forms.ListBox lstItens;
        private System.Windows.Forms.Button btnLimpar;
        private System.Windows.Forms.TextBox txtInfo;
        private System.Windows.Forms.Button btnSoNumero;
        private System.Windows.Forms.Label lblResultado;
    }
}

