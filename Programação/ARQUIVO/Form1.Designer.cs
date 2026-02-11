namespace ARQUIVO
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
            this.txtCaminho = new System.Windows.Forms.TextBox();
            this.btnSelecionar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.btnCriar = new System.Windows.Forms.Button();
            this.nomeArquivo = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.btnCarregar = new System.Windows.Forms.Button();
            this.txtCarregar = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.btnAdicionar = new System.Windows.Forms.Button();
            this.txtTexto = new System.Windows.Forms.TextBox();
            this.btnGravar = new System.Windows.Forms.Button();
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.SuspendLayout();
            // 
            // txtCaminho
            // 
            this.txtCaminho.Location = new System.Drawing.Point(73, 60);
            this.txtCaminho.Name = "txtCaminho";
            this.txtCaminho.Size = new System.Drawing.Size(528, 22);
            this.txtCaminho.TabIndex = 0;
            // 
            // btnSelecionar
            // 
            this.btnSelecionar.Location = new System.Drawing.Point(630, 60);
            this.btnSelecionar.Name = "btnSelecionar";
            this.btnSelecionar.Size = new System.Drawing.Size(120, 23);
            this.btnSelecionar.TabIndex = 1;
            this.btnSelecionar.Text = "Selecionar";
            this.btnSelecionar.UseVisualStyleBackColor = true;
            this.btnSelecionar.Click += new System.EventHandler(this.btnSelecionar_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(84, 33);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(63, 16);
            this.label1.TabIndex = 2;
            this.label1.Text = "Caminho ";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(84, 96);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(89, 16);
            this.label2.TabIndex = 5;
            this.label2.Text = "nome arquivo";
            // 
            // btnCriar
            // 
            this.btnCriar.Location = new System.Drawing.Point(630, 125);
            this.btnCriar.Name = "btnCriar";
            this.btnCriar.Size = new System.Drawing.Size(120, 23);
            this.btnCriar.TabIndex = 4;
            this.btnCriar.Text = "Criar";
            this.btnCriar.UseVisualStyleBackColor = true;
            this.btnCriar.Click += new System.EventHandler(this.btnCriar_Click);
            // 
            // nomeArquivo
            // 
            this.nomeArquivo.Location = new System.Drawing.Point(73, 125);
            this.nomeArquivo.Name = "nomeArquivo";
            this.nomeArquivo.Size = new System.Drawing.Size(528, 22);
            this.nomeArquivo.TabIndex = 3;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(70, 420);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(53, 16);
            this.label3.TabIndex = 11;
            this.label3.Text = "Arquivo";
            // 
            // btnCarregar
            // 
            this.btnCarregar.Location = new System.Drawing.Point(87, 566);
            this.btnCarregar.Name = "btnCarregar";
            this.btnCarregar.Size = new System.Drawing.Size(75, 23);
            this.btnCarregar.TabIndex = 10;
            this.btnCarregar.Text = "Carregar";
            this.btnCarregar.UseVisualStyleBackColor = true;
            this.btnCarregar.Click += new System.EventHandler(this.btnCarregar_Click);
            // 
            // txtCarregar
            // 
            this.txtCarregar.Location = new System.Drawing.Point(73, 439);
            this.txtCarregar.Multiline = true;
            this.txtCarregar.Name = "txtCarregar";
            this.txtCarregar.Size = new System.Drawing.Size(528, 98);
            this.txtCarregar.TabIndex = 9;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(87, 204);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(41, 16);
            this.label4.TabIndex = 8;
            this.label4.Text = "Texto";
            // 
            // btnAdicionar
            // 
            this.btnAdicionar.Location = new System.Drawing.Point(168, 363);
            this.btnAdicionar.Name = "btnAdicionar";
            this.btnAdicionar.Size = new System.Drawing.Size(75, 23);
            this.btnAdicionar.TabIndex = 7;
            this.btnAdicionar.Text = "adicionar";
            this.btnAdicionar.UseVisualStyleBackColor = true;
            this.btnAdicionar.Click += new System.EventHandler(this.btnAdicionar_Click);
            // 
            // txtTexto
            // 
            this.txtTexto.Location = new System.Drawing.Point(73, 223);
            this.txtTexto.Multiline = true;
            this.txtTexto.Name = "txtTexto";
            this.txtTexto.Size = new System.Drawing.Size(528, 112);
            this.txtTexto.TabIndex = 6;
            // 
            // btnGravar
            // 
            this.btnGravar.Location = new System.Drawing.Point(73, 363);
            this.btnGravar.Name = "btnGravar";
            this.btnGravar.Size = new System.Drawing.Size(75, 23);
            this.btnGravar.TabIndex = 12;
            this.btnGravar.Text = "gravar";
            this.btnGravar.UseVisualStyleBackColor = true;
            this.btnGravar.Click += new System.EventHandler(this.btnGravar_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 662);
            this.Controls.Add(this.btnGravar);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btnCarregar);
            this.Controls.Add(this.txtCarregar);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btnAdicionar);
            this.Controls.Add(this.txtTexto);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnCriar);
            this.Controls.Add(this.nomeArquivo);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnSelecionar);
            this.Controls.Add(this.txtCaminho);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtCaminho;
        private System.Windows.Forms.Button btnSelecionar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnCriar;
        private System.Windows.Forms.TextBox nomeArquivo;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnCarregar;
        private System.Windows.Forms.TextBox txtCarregar;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnAdicionar;
        private System.Windows.Forms.TextBox txtTexto;
        private System.Windows.Forms.Button btnGravar;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
    }
}

